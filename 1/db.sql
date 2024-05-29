USE sam;
CREATE TABLE SPORT(
    Example INT PRIMARY KEY AUTO_INCREMENT,
    Sky CHAR(7),
    AirTemp CHAR(7),
    Humidity CHAR(7),
    Wind CHAR(7),
    Water CHAR(7),
    Forecast CHAR(7),
    EnjoySport CHAR(3)
);
DESCRIBE SPORT;
INSERT INTO sport (Sky,AirTemp,Humidity,Wind,Water,Forecast,EnjoySport)
VALUES ("Sunny","Warm","Normal","Strong","Warm","Same","Yes");
INSERT INTO sport (Sky,AirTemp,Humidity,Wind,Water,Forecast,EnjoySport)
VALUES ("Sunny","Warm","High","Strong","Warm","Same","Yes");
INSERT INTO sport (Sky,AirTemp,Humidity,Wind,Water,Forecast,EnjoySport)
VALUES ("Rainy","Cold","High","Strong","Warm","Change","No");
INSERT INTO sport (Sky,AirTemp,Humidity,Wind,Water,Forecast,EnjoySport)
VALUES ("Sunny","Warm","High","Strong","Cool","Change","Yes");
INSERT INTO sport (Sky,AirTemp,Humidity,Wind,Water,Forecast,EnjoySport)
VALUES ("Sunny","Warm","High","Strong","Cool","Change","Yes");

SELECT * FROM sport;