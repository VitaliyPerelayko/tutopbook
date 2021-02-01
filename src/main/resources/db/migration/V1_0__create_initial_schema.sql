-- schema tutor
-- ----------------------------------
CREATE SCHEMA IF NOT EXISTS tutor DEFAULT CHARACTER SET utf8;
USE tutor;
-- ----------------------------------
-- table user
-- ----------------------------------
CREATE TABLE IF NOT EXISTS user (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NULL,
    PRIMARY KEY (id)
);
-- ----------------------------------
-- table role
-- ----------------------------------
CREATE TABLE IF NOT EXISTS tutor.role (
    id   BIGINT      NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);
-- ----------------------------------
-- many-to-many user has role
-- ----------------------------------
CREATE TABLE IF NOT EXISTS tutor.user_has_role (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    CONSTRAINT fk_user_id
        FOREIGN KEY (user_id)
            REFERENCES user (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT fk_role_id
        FOREIGN KEY (role_id)
            REFERENCES role (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);
-- ----------------------------------
-- table lesson
-- ----------------------------------
CREATE TABLE IF NOT EXISTS tutor.lesson (
    id   BIGINT      NOT NULL AUTO_INCREMENT,
    date_time DATETIME NOT NULL,
    student_id BIGINT NOT NULL,
    comment VARCHAR(200) NULL,
    home_work VARCHAR(200) NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_user_id
        FOREIGN KEY (student_id)
            REFERENCES user (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);
-- ----------------------------------
-- table message
-- ----------------------------------
CREATE TABLE IF NOT EXISTS tutor.message (
    id   BIGINT      NOT NULL AUTO_INCREMENT,
    date_time DATETIME NOT NULL,
    user_id BIGINT NOT NULL,
    text VARCHAR(200) NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_user_id
        FOREIGN KEY (user_id)
            REFERENCES user (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)


