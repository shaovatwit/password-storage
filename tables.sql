CREATE TABLE IF NOT EXISTS username (
    username_id int GENERATED ALWAYS AS IDENTITY primary key not null,
    email TEXT,
    password TEXT not null
);