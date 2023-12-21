# User Study
## Design
### Overview 
We conducted an empirical pilot study of 20 participants ages 18-24 varying in gender, sex, and concentration of study, though skewing towards female and CS or CS-adjacent students. All participants were provided a consent form which required a verbal consent for participation in our study; they were additionally informed of their right to withdraw at any point before, during, or after their participation.

### Measuring and Comparing User Web Literacy 
To evaluate CredBot’s efficacy on changing user web literacy, each participant independently filled a pre-study survey measuring their web literacy on a nominal scale through agreement with statements (e.g. “I usually check an article author's credentials”) and term familiarity (e.g. “promoted content” or “hyperlinks”). For agreement-with statements, users indicated how well the statement describes them on a five-point scale from “Strongly Disagree” to “Strongly Agree.” Users noted their familiarity with terms on a four-point scale from “Not familiar at all” to “Very familiar.” Our selected terms and statements, as seen in Figure 5 and 6, corresponded to selected credibility signals so we could measure quantitative changes in user self-reported web literacy after they interacted with CredBot. At the end of our study session, participants filled out a survey containing identical web literacy terms and statements so that we could observe any quantitative changes in their scores.

### User-Perceived Website Credibility Ratings Before and After CredBot Interaction
During a 45 minute study session with a researcher, users visited two sets of four websites on a Google search results page prototype on Figma with hardcoded results to ensure visual consistency. Each set of websites correspond to one of two hypothetical search queries: "is the COVID-19 vaccine safe?” or “how to increase productivity?” In each set, we selected two websites from two domains rated either low or high in credibility by our selected signals’ criteria (i.e. 1 set consists of 4 websites: 1A, 2A, 1B, and 2B selected from domains A and B); the four domains we selected were the Center for Disease Control (CDC) and Natural News for the COVID query, and British Broadcasting Channel (BBC) Science Focus and Chanty for productivity query. Participants were first asked to visit two specified websites, one from each domain, while being allowed to Google search or explore the website for two minutes, then to fill a survey rating each site’s credibility and providing their rationale. Users were asked to rate each website's credibility as “Not credible at all,” “Somewhat credible,” or “Very credible”. Afterwards, participants visited the remaining two websites from the two domains with CredBot activated. They could not Google search or explore the website further, but were allowed to read CredBot’s initial credibility rating and prompt the chatbot for further information and clarification. Participants would fill an identical survey ranking website credibility afterwards so we could measure any changes in user-perceived website credibility.  In particular, we hoped to see that users' credibility rankings for high-credibility websites, such as BBC Focus and CDC, increased after using CredBot. Conversely, we hoped to see a decrease in users' credibility rankings for low-credibility websites, such as Chanty and Natural News.

Because the public version of OpenAI’s API does not support the analysis or interpretation of images and because of the difficulties of parsing a webpage’s innerHTML, CredBot was not able to access certain information such as relatively obscure author credentials and visual ad volume. This limitation necessitated hardcoding for inaccessible information and overall credibility rating in our prompt engineering in order to produce consistent results and responses for this particular user study. 

## Thematic analysis 
![Qualitative analysis thematic map](https://github.com/alexamichela/credBot/assets/106221079/71922ef1-9877-4a3d-bbfb-15a437905205)

Based on observed interactions and surveys, we identified two major areas of want users have for CredBot: education and assistance (Figure 7). As an on-demand education tool, upon CredBot’s initial credibility rating users' subsequent prompts frequently indicated a want for CredBot to define specific signal meanings and elaborate on the signal’s contextual application to a given webpage, and or the signals’ relevance to website credibility. Given CredBot’s responses, participants would express higher trust in both the chatbot’s credibility rating, as well as confidence in their own initial impressions of a given domain if it aligned with CredBot’s. 

“[CredBot] solidified my opinion of this site as less credible. It gave a few more reasons to be skeptical of the site than I had thought of before interacting with credbot” (Participant 16). 

In addition to signal application on a given webpage, participants often wanted CredBot to provide further information not immediately obvious on the webpage or would otherwise require further external research. In response to this need, participants appreciated the expediency of CredBot’s access and summary of such information. 

“I liked how it told me about the owner of the website and writer of the posts, additional information that I would not be able to conveniently get unless I did a bit of a few searches myself” (Participant 18). 

In general, participant satisfaction often relied on the consistency and scope of CredBot’s responses. More specifically, they expected CredBot’s responses to be consistent throughout the conversation and present its text in a digestible manner. Structurally, participants suggested improvements CredBot could make in its response presentation (i.e. separate and or truncate its responses instead of presenting a large block of text). All in all, participants expressed a high likelihood of utilizing a more developed CredBot or similar tools for everyday usage and for task-specific purposes such as academic research. 

From these survey results, we found promising results of the effectiveness of CredBot in increasing users’ web literacy.

## Methods for Data Analysis
In order to discover whether there was a significant difference in users' perceived credibility of websites and overall web literacy before and after using CredBot, we will analyze both the quantitative and qualitative elements of pre- and post-study surveys.

### Perceived Website Credibility
In order to analyze users' credibility rankings for the given websites, we intended to conduct paired t-tests in order to determine if there were significant differences between the rankings before and after the study. In particular, we hoped to see that users' credibility rankings for high-credibility websites, such as BBC Focus and CDC, increased after using CredBot. Conversely, we hoped to see a decrease in users' credibility rankings for low-credibility websites, such as Chanty and Natural News.

In order to conduct a paired t-test, we had to check that the paired t-test assumptions are met:
1. the data is paired: this is true for all of the data because users supplied credibility rankings both before and after using CredBot
2. big sample size: Our sample size is only 21, so we so must check that the differences of pairs follow a Normal distribution

In order to check that the differences of pairs follow a Normal distribution, we conducted a Shapiro-Wilk normality test on the paired differences. Because the p-values for all four tests for each website were approximately 0, we have sufficient evidence to reject the null hypothesis that the data are normally distributed. Thus, we conducted a Paired Samples Wilcoxon Test instead.

### Familiarity with Related Credibility Terms
In order to analyze users' familiarity with credibility-related terms, we similarly intended to conduct paired t-tests in order to determine if there were significant differences between the familiarity before and after the study. We conducted the same Shapiro-Wilk normality test to determine if we could conduct the paired-tests. For 9/10 terms, we had to conduct the paired Wilcoxon test. "Author credentials" was the only term we could conduct a paired t-test for.

### Identification with Internet Use Habits
In order to analyze users' identification with internet use habits, we similarly intended to conduct paired t-tests in order to determine if there were significant differences between the identification before and after the study. We conducted the same Shapiro-Wilk normality test to determine if we could conduct the paired-tests. For 11/13 statements, we had to conduct the paired Wilcoxon test. "Author credentials" was the only term we could conduct a paired t-test for. The 2 statements where we conducted a paired t-test were:
1. Whether a website's URL contains "HTTPS" affects how much I trust its content.
2. I usually check an article author's credentials.
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
We found that 9/10 terms had a mean increase in user familiarity with the term after using CredBot. The one term that didn't have a mean increase was "Website Domain," and the mean remained constant after using CredBot. Out of the 9 terms, only "Hyperlinks" had a statistically significant difference with a paired Wilcoxon test p-value of 0.04771.
### Identification with Internet Use Habits
We found that 11/13 statements had a mean increase in users’ identification after using CredBot. Only 6 of those 11 statements had a statistically significant increase. The six statements were:
1. I care about which organization owns the websites I visit.
2. I trust websites with domains such as "gov" or "org" more compared to websites with domains like "com" or "net".
3. How well-known an author is affects how much I trust their writing.
4. I usually check an article author's credentials.
5. The number of ads on a website affects how much I trust its content.
6. Whether a website's owner/organization is non-profit or for-profit affects how much I trust the website.


