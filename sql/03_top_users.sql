-- Топ-10 самых активных пользователей по количеству оценок
-- Здесь JOIN не нужен: все данные есть в таблице ratings

SELECT 
    user_id,
    COUNT(*) AS num_ratings
FROM ratings
GROUP BY user_id
ORDER BY num_ratings DESC
LIMIT 10;
