-- think about deletes
CREATE TABLE
    IF NOT EXISTS users (
        user_id SERIAL PRIMARY KEY,
        password VARCHAR(30) NOT NULL,
        first_name VARCHAR(20) NOT NULL,
        last_name VARCHAR(20) NOT NULL,
        email VARCHAR(50) NOT NULL,
        account_type VARCHAR(10) NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS rooms (
        room_id SERIAL PRIMARY KEY,
        name VARCHAR(20) NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS events (
        event_id SERIAL PRIMARY KEY,
        description TEXT NOT NULL,
        date DATE DEFAULT CURRENT_DATE, -- come back tho this
        name VARCHAR(20) NOT NULL,
        room_id INT REFERENCES rooms (room_id) ON DELETE RESTRICT
    );

CREATE TABLE
    IF NOT EXISTS user_events (
        event_id INT REFERENCES events (event_id) ON DELETE RESTRICT,
        user_id INT REFERENCES users (user_id) ON DELETE CASCADE
    );

CREATE TABLE
    IF NOT EXISTS workouts (
        workout_id SERIAL PRIMARY KEY,
        name VARCHAR(20) NOT NULL,
        description TEXT NOT NULL,
        reps INT NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS user_workouts (
        workout_id INT REFERENCES workouts (workout_id) ON DELETE RESTRICT,
        user_id INT REFERENCES users (user_id) ON DELETE CASCADE,
        notes TEXT -- come back tho this (put notes here as the notes are a user's specific notes on an exercise)
    );

CREATE TABLE
    IF NOT EXISTS health_goals (
        goal_id SERIAL PRIMARY KEY,
        title VARCHAR(50) NOT NULL,
        detail TEXT NOT NULL,
        progress INT NOT NULL DEFAULT 0, -- come back tho this
        created DATE DEFAULT CURRENT_DATE, -- come back tho this
        user_id INT REFERENCES users (user_id) ON DELETE CASCADE
    );

CREATE TABLE
    IF NOT EXISTS loyalty_points (
        member_id INT REFERENCES users (user_id) ON DELETE CASCADE,
        points INT NOT NULL DEFAULT 0
    );

CREATE TABLE
    IF NOT EXISTS sessions (
        -- can have multiple people in a session
        session_id SERIAL PRIMARY KEY,
        progress_notes TEXT,
        date DATE DEFAULT CURRENT_DATE
    );

CREATE TABLE
    IF NOT EXISTS users_sessions (
        session_id INT REFERENCES sessions (session_id),
        trainer_id INT REFERENCES users (user_id) ON DELETE CASCADE,
        member_id INT REFERENCES users (user_id) ON DELETE CASCADE, -- think about this
        PRIMARY KEY (session_id, trainer_id, member_id)
    );