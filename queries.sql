-- 1) Create a new event that happens in the "Multipurpose Room 3" 
INSERT INTO
    events (name, description, date, room_id)
VALUES
    (
        'Spin Class',
        'Cool Winter Spin class!',
        '2023-12-10',
        (
            SELECT
                room_id
            FROM
                rooms
            WHERE
                name = 'Multipurpose Room 3'
        )
    );

-- 2) update the user profile of a member named "Ella" (rethink this description)
UPDATE users
SET
    first_name = 'Eleanor',
    last_name = 'Stockport',
    email = 'eleanor@email.com'
WHERE
    first_name = 'Ella';

-- 3) Get the name all members who have a session with the trainer "Jeff"
SELECT DISTINCT
    u.first_name,
    u.last_name,
    u2.first_name as trainer_name
FROM
    users u
    JOIN users_sessions us ON u.user_id = us.member_id
    JOIN sessions s ON us.session_id = s.session_id
    JOIN users u2 on us.trainer_id = u2.user_id
WHERE
    us.trainer_id = (
        SELECT
            user_id
        FROM
            users
        WHERE
            first_name = 'Jeff'
    );

-- 4) Get all members who have made more than 50% progress on thier health goals
SELECT
    u.first_name,
    u.last_name,
    hg.progress
FROM
    users u
    JOIN health_goals hg ON u.user_id = hg.user_id
WHERE
    hg.progress > 50;

-- 5) get all the workouts that the memeber "Jane" is doing
SELECT
    w.*,
    u.first_name
FROM
    workouts w
    JOIN user_workouts uw ON w.workout_id = uw.workout_id
    JOIN users u ON uw.user_id = u.user_id
WHERE
    u.first_name = 'Jane';

-- 6) get all rooms that do not have are not sceduled to be used for an event
SELECT
    r.name
FROM
    rooms r
    LEFT JOIN events e ON r.room_id = e.room_id
WHERE
    e.room_id IS NULL;

-- 7) get the name of the user with the most most loyalty points
SELECT
    u.first_name,
    u.last_name,
    lp.points
FROM
    users u
    JOIN loyalty_points lp ON u.user_id = lp.member_id
ORDER BY
    lp.points DESC
LIMIT
    1;

-- 8) reset all the fitness goals of the member "Jack" to have 0 progress
UPDATE health_goals
SET
    progress = 0
WHERE
    user_id = (
        SELECT
            user_id
        FROM
            users
        WHERE
            first_name = 'Jack'
    );

-- 9) get the name of the member that has the least amount of exercise sessions 
SELECT
    u.first_name,
    u.last_name,
    COUNT(us.session_id) as num_of_sessions
FROM
    users u
    LEFT JOIN users_sessions us ON u.user_id = us.member_id
WHERE
    u.account_type = 'member'
GROUP BY
    u.user_id
ORDER BY
    COUNT(us.session_id) ASC
LIMIT
    1;

-- 9) get the name of the member that has the least amount of exercise sessions (think about this one)
-- 10) get the average health goal progress for each member in decending order
SELECT
    u.first_name,
    u.last_name,
    AVG(hg.progress) AS average_progress
FROM
    users u
    JOIN health_goals hg ON u.user_id = hg.user_id
GROUP BY
    u.user_id
ORDER BY
    average_progress DESC;

-- get the memever who attends more thatn the average number of events???
-- get all the days that dont have antyhing scheduled
-- get the event that most people have signed up for