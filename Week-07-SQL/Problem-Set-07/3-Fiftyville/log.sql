-- Looking for a crime scene report that matches the date and the
-- location of the crime.
SELECT description
  FROM crime_scene_reports
 WHERE year = 2023
   AND month = 7
   AND day = 28;

-- Filter interview transcripts that mentions the bakery on the
-- day of the robbery.
SELECT transcript
  FROM interviews
 WHERE year = 2023
   AND month = 7
   AND day = 28
   AND transcript LIKE '%bakery%';

-- Looking for cars that left the Emma's bakery parking lot around 10 am.
SELECT bakery_security_logs.activity, bakery_security_logs.license_plate,
       people.name
  FROM people
  JOIN bakery_security_logs
    ON bakery_security_logs.license_plate = people.license_plate
 WHERE bakery_security_logs.year = 2023
   AND bakery_security_logs.month = 7
   AND bakery_security_logs.day = 28
   AND bakery_security_logs.hour = 10
   AND bakery_security_logs.minute BETWEEN 15 AND 25;

-- Looking for people who was withdrawing their cash at the ATM
-- on Leggett Street on the day of the robbery.
SELECT people.name, atm_transactions.transaction_type
  FROM people
  JOIN bank_accounts
    ON bank_accounts.person_id = people.id
  JOIN atm_transactions
    ON atm_transactions.account_number = bank_accounts.account_number
 WHERE atm_transactions.year = 2023
   AND atm_transactions.month = 7
   AND atm_transactions.day = 28
   AND atm_location = 'Leggett Street'
   AND atm_transactions.transaction_type = 'withdraw';

----- ONLY APPLIED ONCE -----
-- Altering "phone_calls" table to add caller & receiver name
-- ALTER TABLE phone_calls
--        ADD caller_name text;

-- ALTER TABLE phone_calls
--        ADD receiver_name text;

-- Update "phone_calls" table and set caller name to people name
UPDATE phone_calls
   SET caller_name = people.name
  FROM people
 WHERE phone_calls.caller = people.phone_number;

-- Update "phone_calls" table and set receiver name to people name
UPDATE phone_calls
   SET receiver_name = people.name
  FROM people
 WHERE phone_calls.receiver = people.phone_number;

-- Looking for caller & receiver name of people who was talking
-- on the phone for less than a minute.
SELECT caller, caller_name, receiver, receiver_name
  FROM phone_calls
 WHERE year = 2023
   AND month = 7
   AND day = 28
   AND duration < 60;

-- Check for earliest flight out of Fiftyville on the day after the robbery.
  SELECT id, hour, minute, origin_airport_id, destination_airport_id
    FROM flights
   WHERE year = 2023
     AND month = 7
     AND day = 29
ORDER BY hour
   LIMIT 1;

-- Explore airports to find the city of airport id (8).
SELECT id, city
  FROM airports
 WHERE airports.id = 8;

-- Explore airports to find the city of airport id (4).
SELECT id, city
  FROM airports
 WHERE airports.id = 4;

-- Extract the list of passengers that went to New York City
-- (airport id: 4).
  SELECT flights.destination_airport_id, name, phone_number,
         license_plate
    FROM people
    JOIN passengers
      ON people.passport_number = passengers.passport_number
    JOIN flights
      ON flights.id = passengers.flight_id
   WHERE flights.id = 36
ORDER BY flights.hour;

-- Combine info in all four tables based on testimony.
SELECT people.name
  FROM passengers
  JOIN people
    ON people.passport_number = passengers.passport_number
 WHERE passengers.flight_id = 36
   AND people.name IN
       (SELECT caller_name
          FROM phone_calls
         WHERE year = 2023
           AND month = 7
           AND day = 28
           AND duration < 60)
   AND people.name IN
       (SELECT people.name
          FROM atm_transactions
          JOIN bank_accounts
            ON atm_transactions.account_number = bank_accounts.account_number
          JOIN people
            ON bank_accounts.person_id = people.id
         WHERE atm_location = 'Leggett Street'
           AND atm_transactions.year = 2023
           AND atm_transactions.month = 7
           AND atm_transactions.day = 28)
   AND people.name IN
       (SELECT people.name
          FROM bakery_security_logs
          JOIN people
            ON people.license_plate = bakery_security_logs.license_plate
         WHERE bakery_security_logs.year = 2023
           AND bakery_security_logs.month = 7
           AND bakery_security_logs.day = 28
           AND bakery_security_logs.hour = 10
           AND bakery_security_logs.minute BETWEEN 15 AND 25);
