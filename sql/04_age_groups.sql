-- Топ-10 фильмов для каждой возрастной группы
-- Разбиваем пользователей на 4 группы по возрасту (CASE WHEN)
-- Считаем средний рейтинг и количество оценок (AVG, COUNT)
-- HAVING отсекает фильмы с малым числом оценок (< 20)
-- ORDER BY сортирует сначала по группе, потом по рейтингу

SELECT 
    CASE 
        WHEN users.age < 25 THEN 'young'
        WHEN users.age < 40 THEN 'middle'
        WHEN users.age < 60 THEN 'adult'
        ELSE 'senior'
    END AS age_group,
    movies.title AS title,
    COUNT(*) AS num_ratings,
    AVG(ratings.rating) AS avg_rating
FROM ratings
JOIN movies ON movies.item_id = ratings.item_id
JOIN users  ON users.user_id = ratings.user_id
GROUP BY age_group, movies.title
HAVING COUNT(*) >= 20
ORDER BY age_group ASC, avg_rating DESC;
