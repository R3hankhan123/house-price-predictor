## House Price predictor
It is an app that uses a python model to predict the price of houses in delhi. It uses  XGBoost Regression to predict the prices and by using flask as backend to connect to flutter



## API Reference

#### Get the Price

```http
  GET http://127.0.0.1:8000//predict?area=&bedrooms=&psf=&feature_score=&LocationPremium=&LogPremium=
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `area`    | `int`    | Area of the house |
|`bedrooms`|`int`| No of bedrooms Required|
|`psf`|`float`|Price per square feet of the given location(predetermined)|
|`feature_score`|`int`|Each requirement is given a score and the total is given as argument|
|`LocationPremium`|`float`|A predetermined score for each location|
|`LogPremium`|`float`| The natural log of LocationPremium|

#### Response



| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `prediction`| `string` | The predicted price of the house |

