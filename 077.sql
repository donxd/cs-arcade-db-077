/*Please add ; after each select statement*/
CREATE PROCEDURE giftPackaging()
BEGIN
    SELECT 
    ff.its_package package_type
    , COUNT(ff.its_package) number
    FROM (
        SELECT 
        g.id gift_id
        , (
            SELECT package_type 
            FROM packages p 
            WHERE (
                p.length >= g.length
                AND p.width >= g.width
                AND p.height >= g.height
            ) 
            ORDER BY (p.length * p.width * p.height) ASC
            LIMIT 1
        ) its_package
        FROM gifts g
    ) ff
    GROUP BY package_type
    ORDER BY package_type ASC
    ;
END