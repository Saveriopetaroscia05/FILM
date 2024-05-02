<?php
function get_movies($search_input, $search_filter) {
    $movies = array();

    $mysqli = new mysqli('localhost', 'root', 'root', 'db_film');
    if ($mysqli->connect_errno) {
        echo "Failed: " . $mysqli->connect_error;
        exit();
    }

    if ($search_input !== NULL) {
        $movies_query = 'SELECT * FROM movie WHERE ' . $search_filter . ' LIKE "%' . $search_input . '%"';
    } else if ($search_input === NULL) {
        $movies_query = 'SELECT * FROM movie';
    }

    $movies_result = $mysqli->query($movies_query);

    while ($movies_row = $movies_result->fetch_assoc()) {
        $movies[] = $movies_row;

        $last_movie = $movies[count($movies) - 1];
        $movie_id = $last_movie['id'];

        $actors_query = 'SELECT actor.* FROM movie_actor 
        INNER JOIN actor ON actor.id = movie_actor.actor_id 
        WHERE movie_actor.movie_id = ' . $movie_id;

        $actors_result = $mysqli->query($actors_query);
        if (!$actors_result) {
            die("Error $movie_id: " . $mysqli->connect_error);
        }

        while ($actors_row = $actors_result->fetch_assoc()) {
            $movies[count($movies) - 1]['actors'][] = $actors_row;
        }

        $directors_query = 'SELECT director.* FROM movie_director 
        INNER JOIN director ON director.id = movie_director.director_id 
        WHERE movie_director.movie_id = ' . $movie_id;

        $directors_result = $mysqli->query($directors_query);
        if (!$directors_result) {
            die("Error $movie_id: " . $mysqli->connect_error);
        }

        while ($directors_row = $directors_result->fetch_assoc()) {
            $movies[count($movies) - 1]['directors'][] = $directors_row;
        }

        $genres_query = 'SELECT genre.* FROM movie_genre 
        INNER JOIN genre ON genre.id = movie_genre.genre_id 
        WHERE movie_genre.movie_id = ' . $movie_id;

        $genres_result = $mysqli->query($genres_query);
        if (!$genres_result) {
            die("Error $movie_id: " . $mysqli->connect_error);
        }

        while ($genres_row = $genres_result->fetch_assoc()) {
            $movies[count($movies) - 1]['genres'][] = $genres_row;
        }
    }

    $mysqli->close();

    return $movies;
}

function get_actors($search_input, $search_filter) {
    $actors = array();

    $mysqli = new mysqli('localhost', 'root', '', 'db_film');
    if ($mysqli->connect_errno) {
        echo "Failed: " . $mysqli->connect_error;
        exit();
    }

    if ($search_input !== NULL) {
        $query = 'SELECT * FROM actor WHERE ' . $search_filter . ' LIKE "%' . $search_input . '%"';
    } else if ($search_input === NULL) {
        $query = 'SELECT * FROM actor';
    }

    $result = $mysqli->query($query);

    while ($row = $result->fetch_assoc()) {
        $actors[] = $row;
    }

    $mysqli->close();

    return $actors;
}

function get_directors($search_input, $search_filter) {
    $directors = array();

    $mysqli = new mysqli('localhost', 'root', '', 'db_film');
    if ($mysqli->connect_errno) {
        echo "Failed: " . $mysqli->connect_error;
        exit();
    }

    if ($search_input !== NULL) {
        $query = 'SELECT * FROM director WHERE ' . $search_filter . ' LIKE "%' . $search_input . '%"';
    } else if ($search_input === NULL) {
        $query = 'SELECT * FROM director';
    }

    $result = $mysqli->query($query);

    while ($row = $result->fetch_assoc()) {
        $directors[] = $row;
    }

    $mysqli->close();

    return $directors;
}

function get_genres($search_input, $search_filter) {
    $genres = array();

    $mysqli = new mysqli('localhost', 'root', 'root', 'db_film');
    if ($mysqli->connect_errno) {
        echo "Failed: " . $mysqli->connect_error;
        exit();
    }

    if ($search_input !== NULL) {
        $query = 'SELECT * FROM genre WHERE ' . $search_filter . ' LIKE "%' . $search_input . '%"';
    } else if ($search_input === NULL) {
        $query = 'SELECT * FROM genre';
    }

    $result = $mysqli->query($query);

    while ($row = $result->fetch_assoc()) {
        $genres[] = $row;
    }

    $mysqli->close();

    return $genres;
}
?>