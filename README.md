### Mozilla Firefox: Desktop Active User Data

In an effort to contribute to the fight against the COVID-19 pandemic, FireFox is sharing [data](https://blog.mozilla.org/data/2020/03/30/opening-data-to-understand-social-distancing/) on active users for their desktop browser. The period under observation commenced on January 30th, which is the day the World Health Organisation declared corona virus a global pandemic. 

The key variable is "deviation", which represents deviation from forecasted usage under normal conditions. Interpretation of the *deviation* metric is simple. Point 0.0 represents forecasted normal usage, which Firefox estimated using [Facebook’s Prophet forecasting library](https://facebook.github.io/prophet/). Values above point 0.0 indicate increased usage from forecasted normal usage while values below point 0.0 indicate decreased usage.

I have plotted deviation patterns for a select number of countries, which can be grouped as *developed* and *emerging* markets. The aim is to identify differences in usage patterns as well as to examine the extent to which the data trend can be attributed to social distancing. A number of interesting hypothesis will be discussed in a follow-up post. I will also update these plots as Firefox updates the data.
