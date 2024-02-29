-- Database: django task

-- DROP DATABASE IF EXISTS "django task";

CREATE DATABASE "django task"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	
-- Create route table
CREATE TABLE route (
    route_id VARCHAR(20) CHECK (route_id ~ '^RT\d{8}$') PRIMARY KEY,
    user_id INTEGER,
    route_name VARCHAR(255),
    route_origin VARCHAR(255),
    route_destination VARCHAR(255),
    route_stops JSONB
);


-- Create trip table
CREATE TABLE trip (
    trip_id VARCHAR(20) CHECK (trip_id ~ '^TP\d{8}$') PRIMARY KEY,
    user_id INTEGER,
    vehicle_id INTEGER,
    route_id INTEGER,
    driver_name VARCHAR(255),
    trip_distance DECIMAL(10, 2)
);

-- Create booking table
CREATE TABLE booking (
    ticket_id VARCHAR(20) CHECK (ticket_id ~ '^TK\d{8}$') PRIMARY KEY,
    trip_id INTEGER,
    traveller_name VARCHAR(255),
    traveller_number VARCHAR(20) CHECK (traveller_number ~ '^[0-9]+$'),
    ticket_cost DECIMAL(10, 2),
    traveller_email VARCHAR(255) CHECK (traveller_email ~ '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
);

INSERT INTO route (route_id, user_id, route_name, route_origin, route_destination, route_stops)
VALUES
    ('RT20220101', 1, 'Morning Commute', 'Home', 'Work', '{"stop1": "Station A", "stop2": "Station B"}'),
    ('RT20220102', 2, 'Afternoon Trip', 'Office', 'Gym', '{"stop1": "Park", "stop2": "Cafe", "stop3": "Grocery Store"}'),
    ('RT20220103', 3, 'Weekend Adventure', 'Home', 'Beach', '{"stop1": "Scenic Viewpoint", "stop2": "Restaurant", "stop3": "Museum"}'),
    ('RT20220104', 1, 'City Exploration', 'Home', 'City Center', '{"stop1": "Shopping Mall", "stop2": "Historical Site"}'),
    ('RT20220105', 2, 'Nature Hike', 'Cabin', 'Mountain Peak', '{"stop1": "Trailhead", "stop2": "Waterfall"}');


INSERT INTO trip (trip_id, user_id, vehicle_id, route_id, driver_name, trip_distance)
VALUES
    ('TP20220101', 1, 101, 1, 'John Doe', 25.5),
    ('TP20220102', 2, 102, 2, 'Jane Smith', 15.8),
    ('TP20220103', 3, 103, 3, 'Bob Johnson', 30.2),
    ('TP20220104', 1, 104, 4, 'Alice Williams', 18.3),
    ('TP20220105', 2, 105, 5, 'Charlie Brown', 22.7);
	
INSERT INTO booking (ticket_id, trip_id, traveller_name, traveller_number, ticket_cost, traveller_email)
VALUES
    ('TK20220101', 1, 'Alice Johnson', '1234567890', 50.00, 'alice@example.com'),
    ('TK20220102', 2, 'Bob Smith', '9876543210', 35.50, 'bob@example.com'),
    ('TK20220103', 3, 'Charlie Davis', '4567890123', 42.75, 'charlie@example.com'),
    ('TK20220104', 4, 'David Wilson', '7890123456', 60.20, 'david@example.com'),
    ('TK20220105', 5, 'Eva Brown', '2345678901', 75.80, 'eva@example.com');

select*from route;
select*from trip;
select*from booking;


