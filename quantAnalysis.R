surveyData <- read.csv('surveyData.csv', header=TRUE)
summary(surveyData)
dim(surveyData)

# paired t-test for website credibilities
boxplot(surveyData$bbc_cred1, surveyData$bbc_cred2, xlab= 'BBC Focus', 
        ylab= 'Perceived Website Credibility', names= c('Before', 'After'))
mean(surveyData$bbc_cred1) # 2.75
mean(surveyData$bbc_cred2) # 2.9
boxplot(surveyData$chanty_cred1, surveyData$chanty_cred2, xlab= 'Chanty', 
        ylab= 'Perceived Website Credibility', names= c('Before', 'After'))
mean(surveyData$chanty_cred1) # 1.65
mean(surveyData$chanty_cred2) # 1.4
boxplot(surveyData$cdc_cred1, surveyData$cdc_cred2, xlab= 'CDC', 
        ylab= 'Perceived Website Credibility', names= c('Before', 'After'))
mean(surveyData$cdc_cred1) # 2.9
mean(surveyData$cdc_cred2) # 2.9
boxplot(surveyData$nn1, surveyData$nn2, xlab= 'Natural News', 
        ylab= 'Perceived Website Credibility', names= c('Before', 'After'))
mean(surveyData$nn1) # 1.25
mean(surveyData$nn2) # 1.1

# must check paired t-test assumptions:
# 1 paired: yes because same measure twice
# 2 big sample size --> NO so must check that the differences of the pairs follow
# a normal distribution

# compute the difference
d <- with(surveyData, 
          bbc_cred1 - bbc_cred2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 8.317e-08

# compute the difference
d <- with(surveyData, 
          chanty_cred1 - chanty_cred2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 6.902e-05

# compute the difference
d <- with(surveyData, 
          cdc_cred1 - cdc_cred2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 3.579e-07

# compute the difference
d <- with(surveyData, 
          nn1 - nn2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 1.298e-05

# because we can reject the null hypothesis that the data are normally distributed,
# we must conduct a Paired Samples Wilcoxon Test instead

result1 <- wilcox.test(surveyData$bbc_cred1, surveyData$bbc_cred2, paired = TRUE)
result1 # p-value = 0.1489

result2 <- wilcox.test(surveyData$chanty_cred1, surveyData$chanty_cred2, paired = TRUE)
result2 # p-value = 0.0726

result3 <- wilcox.test(surveyData$cdc_cred1, surveyData$cdc_cred2, paired = TRUE)
result3 # p-value = 1

result4 <- wilcox.test(surveyData$nn1, surveyData$nn2, paired = TRUE)
result4 # p-value = 0.3741

# as we can see from all of these p-values, they are all greater than the 
# significance level alpha = 0.05. We do not have sufficient evidence to say that 
# the median credibility score of the websites before using CredBot is  
# different from the median credibility score of the productivity websites after using CredBot.

# just for fun: looking at paired t test
tresult1 <- t.test(surveyData$bbc_cred1, surveyData$bbc_cred2, paired = TRUE)
tresult1 # p-value = 0.08281

tresult2 <- t.test(surveyData$chanty_cred1, surveyData$chanty_cred2, paired = TRUE)
tresult2 # p-value = 0.05634

tresult3 <- t.test(surveyData$cdc_cred1, surveyData$cdc_cred2, paired = TRUE)
tresult3 # p-value = 1

tresult4 <- t.test(surveyData$nn1, surveyData$nn2, paired = TRUE)
tresult4 # p-value = 0.3299
# similarly, they are all greater than the sig level alpha = 0.05. We still do not
# have sufficient evidence to say that the mean credibility scores of the websites
# before and after using CredBot are different

# paired t-test for trust statements
boxplot(surveyData$trust_wo1, surveyData$trust_wo2, 
        xlab= 'I care about which organization owns the websites I visit', 
        ylab= 'how well each statement describes you', names= c('Before', 'After'))
mean(surveyData$trust_wo1) # 3.85
mean(surveyData$trust_wo2) # 4.4
boxplot(surveyData$trust_https1, surveyData$trust_https2, 
        xlab= "Whether a website's URL contains HTTPS affects how much I trust its content.", 
        ylab= 'how well each statement describes you', names= c('Before', 'After'))
mean(surveyData$trust_https1) # 3.125
mean(surveyData$trust_https2) # 3.25
boxplot(surveyData$trust_domain1, surveyData$trust_domain2, 
        xlab= "I trust websites with domains such as gov or org more compared to websites with domains like com or net.", 
        ylab= 'how well each statement describes you', names= c('Before', 'After'))
mean(surveyData$trust_domain1) # 4.2
mean(surveyData$trust_domain2) # 4.65
boxplot(surveyData$trust_bias1, surveyData$trust_bias2, 
        xlab= 'I try to keep possible author bias or opinion in mind when looking for factual information from a website.', 
        ylab= 'how well each statement describes you', names= c('Before', 'After'))
mean(surveyData$trust_bias1) # 3.9
mean(surveyData$trust_bias2) # 4.025
boxplot(surveyData$trust_fame1, surveyData$trust_fame2, 
        xlab= 'How well-known an author is affects how much I trust their writing.', 
        ylab= 'how well each statement describes you', names= c('Before', 'After'))
mean(surveyData$trust_fame1) # 3.4
mean(surveyData$trust_fame2) # 4
boxplot(surveyData$trust_creden1, surveyData$trust_creden2, 
        xlab= "I usually check an article author's credentials.", 
        ylab= 'how well each statement describes you', names= c('Before', 'After'))
mean(surveyData$trust_creden1) # 2.625
mean(surveyData$trust_creden2) # 3.625
boxplot(surveyData$trust_links1, surveyData$trust_links2, 
        xlab= "I recognize links on websites that may lead to external content or advertisements.", 
        ylab= 'how well each statement describes you', names= c('Before', 'After'))
mean(surveyData$trust_links1) # 4.1
mean(surveyData$trust_links2) # 4.45
boxplot(surveyData$trust_advol1, surveyData$trust_advol2, 
        xlab= "The number of ads on a website affects how much I trust its content.", 
        ylab= 'how well each statement describes you', names= c('Before', 'After'))
mean(surveyData$trust_advol1) # 4.4
mean(surveyData$trust_advol2) # 4.65
boxplot(surveyData$trust_misad1, surveyData$trust_misad2, 
        xlab= "I can tell when an ad is intentionally misleading and is trying to get users to click on it unintentionally.", 
        ylab= 'how well each statement describes you', names= c('Before', 'After'))
mean(surveyData$trust_misad1) # 4.05
mean(surveyData$trust_misad2) # 4.175
boxplot(surveyData$trust_tone1, surveyData$trust_tone2, 
        xlab= "I consider the tone of an article (informal or formal) when deciding if I trust the website.", 
        ylab= 'how well each statement describes you', names= c('Before', 'After'))
mean(surveyData$trust_tone1) # 4.05
mean(surveyData$trust_tone2) # 3.95
boxplot(surveyData$trust_clickbait1, surveyData$trust_clickbait2, 
        xlab= "I know what 'clickbait' means and can recognize when it's used online.", 
        ylab= 'how well each statement describes you', names= c('Before', 'After'))
mean(surveyData$trust_clickbait1) # 4.1
mean(surveyData$trust_clickbait2) # 4.1
boxplot(surveyData$trust_services1, surveyData$trust_services2, 
        xlab= "I am aware of when a website is trying to sell me a service in its article.", 
        ylab= 'how well each statement describes you', names= c('Before', 'After'))
mean(surveyData$trust_services1) # 4.25
mean(surveyData$trust_services2) # 4.525
boxplot(surveyData$trust_profit1, surveyData$trust_profit2, 
        xlab= "Whether a website's owner/organization is non-profit or for-profit affects how much I trust the website.", 
        ylab= 'how well each statement describes you', names= c('Before', 'After'))
mean(surveyData$trust_profit1) # 3.5
mean(surveyData$trust_profit2) # 4.1

# must check paired t-test assumptions:
# 1 paired: yes because same measure twice
# 2 big sample size --> NO so must check that the differences of the pairs follow
# a normal distribution

# compute the difference
d <- with(surveyData, 
          trust_wo1 - trust_wo2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 0.02128
# since the p-value is less than the significance level alpha =0.05, we can 
# reject the null hypothesis that the data are normally distributed.
# thus, we must conduct a Paired Samples Wilcoxon Test instead
wilcox.test(surveyData$trust_wo1, surveyData$trust_wo2, paired = TRUE) # p-value = 0.00745
# the p-value is less than the sig level alpha = 0.05. Thus, we have sufficient 
# evidence to reject the null hypothesis and argue that users identify with the statement
# 'I care about which organization owns the websites I visit'
# differently before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          trust_https1 - trust_https2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 0.1132 since the p-value is greater than the
# significance level alpha = 0.05, we cannot reject the null hypothesis that the
# data are normally distributed. thus, we can perform a paired t-test
t.test(surveyData$trust_https1, surveyData$trust_https2, paired = TRUE)
# p-value = 0.6312
# since the p-value is greater than the sig level alpha = 0.05. We do not
# have sufficient evidence to reject the null hypothesis and argue that users identify 
# with the statement
# 'Whether a website's URL contains "HTTPS" affects how much I trust its content'
# differently before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          trust_domain1 - trust_domain2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 0.01453 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
mean(surveyData$trust_domain1) # 4.2
mean(surveyData$trust_domain2) # 4.65
wilcox.test(surveyData$trust_domain1, surveyData$trust_domain2, paired = TRUE)
# p-value = 0.03301
# since the p-value is less than the sig level alpha = 0.05. We have sufficient 
# evidence to reject the null hypothesis and argue that users identify with the statement
# 'I trust websites with domains such as "gov" or "org" more compared to websites 
# with domains like "com" or "net"'
# differently before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          trust_bias1 - trust_bias2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 0.01435 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
wilcox.test(surveyData$trust_bias1, surveyData$trust_bias2, paired = TRUE)
# p-value = 0.5818
# since the p-value is greater than the sig level alpha = 0.05. We do not have sufficient 
# evidence to reject the null hypothesis and argue that users identify with the statement
# 'I try to keep possible author bias or opinion in mind when looking for factual 
# information from a website'
# differently before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          trust_fame1 - trust_fame2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 0.03325 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
mean(surveyData$trust_fame1) # 3.4
mean(surveyData$trust_fame2) # 4
wilcox.test(surveyData$trust_fame1, surveyData$trust_fame2, paired = TRUE)
# p-value = 0.03609
# since the p-value is less than the sig level alpha = 0.05. We have sufficient 
# evidence to reject the null hypothesis and argue that users identify with the statement
# 'How well-known an author is affects how much I trust their writing'
# differently before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          trust_creden1 - trust_creden2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 0.08856 since the p-value is greater than the
# significance level alpha = 0.05, we cannot reject the null hypothesis that the
# data are normally distributed. thus, we can conduct a paired t-test
mean(surveyData$trust_creden1) # 2.625
mean(surveyData$trust_creden2) # 3.625
t.test(surveyData$trust_creden1, surveyData$trust_creden2, paired = TRUE)
# p-value = 0.005873
# since the p-value is less than the sig level alpha = 0.05. We have sufficient 
# evidence to reject the null hypothesis and argue that users identify with the statement
# 'I usually check an article author's credentials'
# differently before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          trust_links1 - trust_links2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 0.01831 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
wilcox.test(surveyData$trust_links1, surveyData$trust_links2, paired = TRUE)
# p-value = 0.09727
# since the p-value is greater than the sig level alpha = 0.05. We do not have sufficient 
# evidence to reject the null hypothesis and argue that users identify with the statement
# 'I recognize links on websites that may lead to external content or advertisements'
# differently before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          trust_advol1 - trust_advol2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 0.007468 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
mean(surveyData$trust_advol1) # 4.4
mean(surveyData$trust_advol2) # 4.65
wilcox.test(surveyData$advol1, surveyData$advol2, paired = TRUE)
# p-value = 0.007468
# since the p-value is less than the sig level alpha = 0.05. We have sufficient 
# evidence to reject the null hypothesis and argue that users identify with the statement
# 'The number of ads on a website affects how much I trust its content'
# differently before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          trust_misad1 - trust_misad2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 0.0161 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
wilcox.test(surveyData$trust_misad1, surveyData$trust_misad2, paired = TRUE)
# p-value = 0.6423
# since the p-value is greater than the sig level alpha = 0.05. We do not have sufficient 
# evidence to reject the null hypothesis and argue that users identify with the statement
# 'I can tell when an ad is intentionally misleading and is trying to get users
# to click on it unintentionally'
# differently before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          trust_tone1 - trust_tone2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 2.92e-05 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
wilcox.test(surveyData$trust_tone1, surveyData$trust_tone2, paired = TRUE)
# p-value = 0.5716
# since the p-value is greater than the sig level alpha = 0.05. We do not have sufficient 
# evidence to reject the null hypothesis and argue that users identify with the statement
# 'I consider the tone of an article (informal or formal) when deciding if I trust the website'
# differently before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          trust_clickbait1 - trust_clickbait2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value =  0.002723 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
wilcox.test(surveyData$trust_clickbait1, surveyData$trust_clickbait2, paired = TRUE)
# p-value = 1
# since the p-value is greater than the sig level alpha = 0.05. We do not have sufficient 
# evidence to reject the null hypothesis and argue that users identify with the statement
# 'I know what "clickbait" means and can recognize when it's used online'
# differently before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          trust_services1 - trust_services2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value =  0.02157 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
wilcox.test(surveyData$trust_services1, surveyData$trust_services2, paired = TRUE)
# p-value = 0.1697
# since the p-value is greater than the sig level alpha = 0.05. We do not have sufficient 
# evidence to reject the null hypothesis and argue that users identify with the statement
# 'I am aware of when a website is trying to sell me a service in its article'
# differently before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          trust_profit1 - trust_profit2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value =  0.0001253 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
mean(surveyData$trust_profit1) # 3.5
mean(surveyData$trust_profit2) # 4.1
wilcox.test(surveyData$trust_profit1, surveyData$trust_profit2, paired = TRUE)
# p-value = 0.006927
# since the p-value is less than the sig level alpha = 0.05. We have sufficient 
# evidence to reject the null hypothesis and argue that users identify with the statement
# 'Whether a website's owner/organization is non-profit or for-profit affects how much I trust the website'
# differently before and after using CredBot.

# paired t-test for familiarity statements
boxplot(surveyData$domain1, surveyData$domain2, xlab= 'Website domain', 
        ylab= 'User Familiarity', names= c('Before', 'After'))
boxplot(surveyData$https1, surveyData$https2, xlab= '"S" in HTTPS', 
        ylab= 'User Familiarity', names= c('Before', 'After'))
boxplot(surveyData$creden1, surveyData$creden2, xlab= 'Author credentials', 
        ylab= 'User Familiarity', names= c('Before', 'After'))
boxplot(surveyData$acad_ref1, surveyData$acad_ref2, xlab= 'Academic references', 
        ylab= 'User Familiarity', names= c('Before', 'After'))
boxplot(surveyData$ext_ads1, surveyData$ext_ads2, xlab= 'External Ads', 
        ylab= 'User Familiarity', names= c('Before', 'After'))
boxplot(surveyData$visual_ads1, surveyData$visual_ads2, xlab= 'Visual Ads', 
        ylab= 'User Familiarity', names= c('Before', 'After'))
boxplot(surveyData$promote1, surveyData$promote2, xlab= 'Promoted content', 
        ylab= 'User Familiarity', names= c('Before', 'After'))
boxplot(surveyData$hyperlinks1, surveyData$hyperlinks2, xlab= 'Hyperlinks', 
        ylab= 'User Familiarity', names= c('Before', 'After'))
boxplot(surveyData$non.profit1, surveyData$non.profit2, xlab= 'Non-profit organization', 
        ylab= 'User Familiarity', names= c('Before', 'After'))
boxplot(surveyData$for.profit1, surveyData$for.profit2, xlab= 'For-profit organization', 
        ylab= 'User Familiarity', names= c('Before', 'After'))

# compute the difference
d <- with(surveyData, 
          domain1 - domain2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 0.0002757 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
mean(surveyData$domain1) # 3.05
mean(surveyData$domain2) # 3.05
wilcox.test(surveyData$domain1, surveyData$domain2, paired = TRUE)
# p-value = 1
# since the p-value is greater than the sig level alpha = 0.05. We do not have sufficient 
# evidence to reject the null hypothesis and argue that users' familiarity with website
# domain is different before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          https1 - https2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 0.003752 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
mean(surveyData$https1) # 2
mean(surveyData$https2) # 2.35
wilcox.test(surveyData$https1, surveyData$https2, paired = TRUE)
# p-value = 0.1449
# since the p-value is greater than the sig level alpha = 0.05. We do not have sufficient 
# evidence to reject the null hypothesis and argue that users' familiarity with 'S' in HTTPS
# is different before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          creden1 - creden2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 0.06453 since the p-value is greater than the
# significance level alpha = 0.05, we cannot reject the null hypothesis that the
# data are normally distributed. thus, we can conduct a paired T-test
mean(surveyData$creden1) # 3.05
mean(surveyData$creden2) # 3.45
t.test(surveyData$creden1, surveyData$creden2, paired = TRUE)
# p-value = 0.1036
# since the p-value is greater than the sig level alpha = 0.05. We do not have sufficient 
# evidence to reject the null hypothesis and argue that users' familiarity with
# Author credentials is different before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          acad_ref1 - acad_ref2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 0.0003765 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
mean(surveyData$acad_ref1) # 3.5
mean(surveyData$acad_ref2) # 3.75
wilcox.test(surveyData$acad_ref1, surveyData$acad_ref2, paired = TRUE)
# p-value = 0.1875
# since the p-value is greater than the sig level alpha = 0.05. We do not have sufficient 
# evidence to reject the null hypothesis and argue that users' familiarity with Academic References
# is different before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          ext_ads1 - ext_ads2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 0.00704 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
mean(surveyData$ext_ads1) # 3.1
mean(surveyData$ext_ads2) # 3.4
wilcox.test(surveyData$ext_ads1, surveyData$ext_ads2, paired = TRUE)
# p-value = 0.1975
# since the p-value is greater than the sig level alpha = 0.05. We do not have sufficient 
# evidence to reject the null hypothesis and argue that users' familiarity with External Ads
# is different before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          visual_ads1 - visual_ads2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 0.001828 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
mean(surveyData$visual_ads1) # 3.1
mean(surveyData$visual_ads2) # 3.35
wilcox.test(surveyData$visual_ads1, surveyData$visual_ads2, paired = TRUE)
# p-value = 0.1521
# since the p-value is greater than the sig level alpha = 0.05. We do not have sufficient 
# evidence to reject the null hypothesis and argue that users' familiarity with Visual Ads
# is different before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          promote1 - promote2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 0.0002905 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
mean(surveyData$promote1) # 3.4
mean(surveyData$promote2) # 3.7
wilcox.test(surveyData$promote1, surveyData$promote2, paired = TRUE)
# p-value = 0.07076
# since the p-value is greater than the sig level alpha = 0.05. We do not have sufficient 
# evidence to reject the null hypothesis and argue that users' familiarity with Promoted Content
# is different before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          hyperlinks1 - hyperlinks2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 1.969e-06 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
mean(surveyData$hyperlinks1) # 3.55
mean(surveyData$hyperlinks2) # 3.85
wilcox.test(surveyData$hyperlinks1, surveyData$hyperlinks2, paired = TRUE)
# p-value = 0.04771
# since the p-value is less than the sig level alpha = 0.05. We have sufficient 
# evidence to reject the null hypothesis and argue that users' familiarity with Hyperlinks
# is different before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          non.profit1 - non.profit2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 0.0001942 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
mean(surveyData$non.profit1) # 3.35
mean(surveyData$non.profit2) # 3.5
wilcox.test(surveyData$non.profit1, surveyData$non.profit2, paired = TRUE)
# p-value = 0.2986
# since the p-value is greater than the sig level alpha = 0.05. We do not have sufficient 
# evidence to reject the null hypothesis and argue that users' familiarity with Non-profit Organizations
# is different before and after using CredBot.

# compute the difference
d <- with(surveyData, 
          for.profit1 - for.profit2)
# Shapiro-Wilk normality test for the differences
shapiro.test(d) # => p-value = 1.306e-05 since the p-value is less than the
# significance level alpha = 0.05, we can reject the null hypothesis that the
# data are normally distributed. thus, we must conduct a Paired Samples Wilcoxon 
# Test instead
mean(surveyData$for.profit1) # 3.3
mean(surveyData$for.profit2) # 3.45
wilcox.test(surveyData$for.profit1, surveyData$for.profit2, paired = TRUE)
# p-value = 0.233
# since the p-value is greater than the sig level alpha = 0.05. We do not have sufficient 
# evidence to reject the null hypothesis and argue that users' familiarity with For-profit Organizations
# is different before and after using CredBot.
