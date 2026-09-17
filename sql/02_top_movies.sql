-- Топ-10 самых популярных фильмов по количеству оценок
-- JOIN нужен, чтобы получить название фильма из таблицы movies

SELECT 
    ratings.item_id,
    movies.title,
    COUNT(*) AS num_ratings
FROM ratings
JOIN movies ON ratings.item_id = movies.item_id
GROUP BY ratings.item_id, movies.title
ORDER BY num_ratings DESC
LIMIT 10;
