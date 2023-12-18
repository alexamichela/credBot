# User Study
## Design

## Methods for Data Analysis
In order to discover whether there was a significant difference in users' perceived credibility of websites and overall web literacy before and after using CredBot, we will analyze both the quantitative and qualitative elements of pre- and post-study surveys.

In order to analyze users' credibility rankings for the given websites, we intended to conduct paired t-tests in order to determine if there were significant differences between the rankings before and after the study. In particular, we hoped to see that users' credibility rankings for high-credibility websites, such as BBC Focus and CDC, increased after using CredBot. Conversely, we hoped to see a decrease in users' credibility rankings for low-credibility websites, such as Chanty and Natural News.

In order to conduct a paired t-test, we had to check that the paired t-test assumptions are met:
1. the data is paired: this is true for all of the data because users supplied credibility rankings both before and after using CredBot
2. big sample size: Our sample size is only 21, so we so must check that the differences of pairs follow a Normal distribution

In order to check that the differences of pairs follow a Normal distribution, we conducted a Shapiro-Wilk normality test on the paired differences. Because the p-values for all four tests for each website were approximately 0, we have sufficient evidence to reject the null hypothesis that the data are normally distributed. Thus, we conducted a Paired Samples Wilcoxon Test instead.
## Results
### Perceived Website Credibility for Productivity Websites
![boxplotBBC](https://github.com/alexamichela/credBot/assets/111940928/3aaae2e0-a40f-40e6-a424-5717a7f1636d)
Mean(Before) = 2.75
Mean(After) = 2.9
Paired Wilcoxon Test p-value = 0.1489
As the boxplot and means of users' credibility rankings show, there seems to be an increase in perceived credibility of BBC Focus after using CredBot. However, the paired Wilcoxon test's p-value says we do not have enough evidence to say that there is a significant difference.
![boxplotChanty](https://github.com/alexamichela/credBot/assets/111940928/f84ed7b9-14c3-4447-82b6-f5965780b441)
Mean(Before) = 1.65
Mean(After) = 1.4
Paired Wilcoxon Test p-value = 0.0726
As the boxplot and means of users' credibility rankings show, there seems to be a decrease in perceived credibility of Chanty after using CredBot. However, the paired Wilcoxon test's p-value says we do not have enough evidence to say that there is a significant difference.
### Perceived Website Credibility for COVID Websites
![boxplotCDC](https://github.com/alexamichela/credBot/assets/111940928/80f195a7-7e44-4d65-be83-e91dde51837d)
Mean(Before) = 2.9
Mean(After) = 2.9
Paired Wilcoxon Test p-value = 1
There is no recognizable difference in users' credibility rankings of CDC after using CredBot, which might be attributed to the users' high credibility of CDC before CredBot. It would not be very possible for users' perceived credibility of CDC to improve, considering their initial rankings.
![boxplotNaturalNews](https://github.com/alexamichela/credBot/assets/111940928/a4396f54-a7a4-4a8d-a0be-cbe999a0c424)
Mean(Before) = 1.25
Mean(After) = 1.1
Paired Wilcoxon Test p-value = 0.3741
As the boxplot and means of users' credibility rankings show, there seems to be a decrease in perceived credibility of Natural News after using CredBot. However, the paired Wilcoxon test's p-value says we do not have enough evidence to say that there is a significant difference.
### Familiarity with Related Credibility Terms

### Identification with Internet Use Habits
