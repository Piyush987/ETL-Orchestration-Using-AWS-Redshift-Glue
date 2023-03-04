INSERT INTO public.reviews
SELECT marketplace, customer_id, review_id, product_id, product_parent, product_title, star_rating, helpful_votes, total_votes, vine, verified_purchase, review_date, year, product_category 
FROM amzreviews.reviews where year>=2015



