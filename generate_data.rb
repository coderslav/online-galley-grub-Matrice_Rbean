require "sqlite3"

require 'json'

File.delete("application.db") rescue nil
db = SQLite3::Database.new "application.db"


# DONE
db.execute <<-SQL
  create table categories (
    id INTEGER NOT NULL PRIMARY KEY,
    name varchar(255)
  );
SQL

db.execute <<-SQL
  create table foods (
    id INTEGER NOT NULL PRIMARY KEY,
    price decimal,
    name varchar(255),
    image_path varchar(255),
    category_id INTEGER
  );
SQL

db.execute <<-SQL
  create table comments (
    id INTEGER NOT NULL PRIMARY KEY,
    title varchar(255),
    content text,
    author varchar(255),
    food_id INTEGER
  );
SQL



db.execute("insert into categories (name) values ('Burgers'), ('Sides'), ('Beverages');")

db.execute <<~SQL
  insert into foods (name, price, category_id, image_path) values
    ('Krabby Patty', 2.99, 1, "patty1.png"),
    ('Double Krabby Patty', 3.99, 1, "patty2.jpeg"),
    ('Triple Krabby Patty', 4.99, 1, "patty3.jpeg"),
    ('Veggie Pattie', 2.99, 1, NULL),


    ('Kelp Rings', 1.50, 2, NULL),
    ('Salty Sea Dog', 1.25, 2, NULL),
    ('Fries', 1, 2, "fries.jpeg"),
    ('Large Oyster Skins', 3.5, 2, NULL),


    ('Kelp Shake', 2.00, 3, "shake.png"),
    ('Super Seaweed Shake', 2.00, 3, NULL),
    ('Seafoam Soda', 1.00, 3, NULL);
SQL






db.execute <<~SQL
  insert into comments (food_id, author, title, content) values
    (1, 'Spongebob', 'Tastes great!', "Menu is perfect, something for everyone. Service was awesome! The main dish, the Krabby Patty, is awesome."),
    (1, 'Squidward Tentacles', 'Very nice', "Visited as a guest in the restaurant for lunch just today. Had the best burger ever !"),
    (1, 'Mr. Krabs', 'Really good!', "We had lunch here a few times while on in the region visiting family and friends. Their burgers are awesome. Must try! (I don't know who own the place but I'm sure his really awesome!)"),

    (2, 'Plankton', 'Super exeperience', "Please give our thanks to the Manager(s) and others. What a great place!"),
    (2, 'Mrs. Puff', 'Amazing time', "This cozy restaurant has left the best impressions! Hospitable hosts, delicious burger, beautiful presentation."),
    (3, 'Spongebob', 'Top!', "It’s the cutest little spot with amazing food. The Triple Krabby Patty is to die for."),

    (4, 'Don the Whale', "I'll come back", "Do yourself a favor and visit this lovely burger place. The service is unmatched. The staff truly cares about your experience. They even have a veggan burger!"),
    (4, 'Spongebob', 'Wow, this food is amazing!', "I have to say, I enjoyed every single bite of the meal. Considering the quality, the price is reasonable. Ideal for those who want a romantic night out."),
    (4, 'Patchy the Pirate', 'Flavorful', "Stopped in for dinner and had a great meal. Staff was helpful and knowledgeable about the menu offering great recommendations."),

    (5, 'King Neptune', 'Awesome', "Excellent rings. Menu is extensive and seasonal to a particularly high standard."),
    (5, 'Mrs. Puff', 'Excellent', "Definitely fine dining. Those rings can be expensive but worth it and they do different deals on different nights so it’s worth checking them out before you book. Highly recommended."),
    (5, 'Spongebob', 'Very nice', "This is my absolute favorite restaurant. The Kelp Rings are always fantastic. In fact, no matter what I order I am always delighted with my meal!"),
    (6, 'Squidward Tentacles', 'Very nice', "We are so fortunate to have this place just a few minutes drive away from home."),
    (7, 'Spongebob', 'Yummy', "Even the fries are stunning. Love this place and will continue to visit."),
    (7, 'King Neptune', 'Top notch fries', "This spot gives extraordinary service and yummy meals. One of my favourite restaurants around town. The meals served rapidly and the rates were reasonable"),
    (8, 'Mrs. Puff', 'Awesome experience', "Delicious food, waiters are very attentive, and super nice atmosphere. YOU MUST TRY THE OYSTER SKINS!"),

    (9, 'Spongebob', 'Outstanding shake', "Amazing experience! If you thought gourmet kitchen will leave you hungry, think again. You should skip several meals before visiting this amazing restaurant. (I absolutely not working there..!)"),
    (9, 'Mr. Krabs', 'Very nice', "Excellent, unassuming and wonderful find. Great variety and fine value tasting menu."),
    (9, 'Dr. Gill Gilliam', 'Mouth-watering', "Phenomenal experience. Top notch Kelp Shake! Have been here multiple times, and every time is an amazing experience all around."),

    (10, 'Mr. Krabs', 'Best shake in town', "This place is elegant with an awesome vibe. I went for breakfast and the food was amazing."),
    (10, 'Patchy the Pirate', "It couldn't be better!", "Loved this place. The atmosphere and food were great. You need to try the Seaweed Shake!"),
    (11, 'Spongebob', 'This tastes different.', "This soda... is not just a soda!")
SQL
