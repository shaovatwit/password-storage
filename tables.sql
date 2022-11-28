CREATE TABLE IF NOT EXISTS username (
    username_id int GENERATED ALWAYS AS IDENTITY primary key not null,
    email VARCHAR(50),
    passwd VARCHAR(50) not null
);