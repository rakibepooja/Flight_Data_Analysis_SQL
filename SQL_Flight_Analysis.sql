use data_analysis_flights

select* from airlines
select* from airports
select * from flights


/*1. How many airlines are listed in this database ?*/
select count(distinct iata_code) as 'airline_count'
from airlines

/*2. Which state has the highest amount of airports ?*/
select top 1 state,count(airport) as 'airport_count'
from airports
group by state
order by airport_count desc

/*3. What was the most common reason for flight cancellation ?*/
select top 1 count(cancel_reason)as 'cancel_count',cancel_reason
from  flights
where cancel_reason is not NULL
group by cancel_reason
order by cancel_count desc


/*Advanced Analysis
1. How many flights, carried out by “American Airlines Inc.”, flew out of “Los
Angeles International Airport” to “Miami International Airport”*/
select count(*) as 'flight_count'
from flights
where airline ='AA'
and origin_airport = 'LAX'
and destination_airport = 'MIA'


/*2. How many flights have been carried out by each airline*/
select airline,count(*)as 'flight_count'
from flights
group by airline
order by flight_count desc


/*3. Which company had the highest amount of delays (in minutes)*/
select top 1 airline ,sum(delay_in_minutes)as 'total_delay'
from flights
where delay_in_minutes is not null
group by airline
order by total_delay desc


/*4. A customer is planning to take a flight from LAX to SFO, based on the
data you have regarding delays, which airline will you recommend him to
take?*/
select top 1 airline,max(delay_in_minutes) as 'maximum_Delay'
from flights
where origin_airport = 'LAX'
and destination_airport = 'SFO'
group by airline
order by maximum_Delay



/*5. Based on the data you have, if a customer is planing to take a flight, what
are the odds it’ll be cancelled?*/
Select count(cancelled) as 'Flight_cancelled ',cancelled
from flights
group by cancelled



/*6. Which aireline company has the highest cancellation rate?*/
select top 1 airline,count(cancelled) as 'cancellation_rate'
from flights
where cancelled = 1
group by airline,cancelled
order by cancellation_rate desc


/*7. Which airport had the highest number of cancellations due to security
issues?*/
select top 1  airline,count(*) as 'cancellation_rate'
from flights
where cancel_reason like '%security%'
group by airline
order by cancellation_rate desc


/*8. Display the number of flights per month*/
select count(*)as 'no_of_flights', month(flight_date) as 'month'
from flights
group by month(flight_date)
order by month