# Introduction
## Background Introduction of the problem
University ranking is a process by which universities are evaluated and ranked according to a series of indicators. While university rankings may vary from institution to institution and country to country, they are usually evaluated based on factors such as academic reputation, teaching quality, research output, level of internationalization, faculty-student ratio, alumni employment and so on.

The university rankings can provide students with a reference for choosing a university, assess the academic level of a university, enhance competitiveness of universities and assist funders and donors in decision-making. Therefore, university rankings are of great significance to universities, students and society.

## DataSet Description
We obtain the data from the [QS World University Rankings](https://www.topuniversities.com/university-rankings/world-university-rankings/2023) website. And the indicators are as follows:
- Acdamic Reputation(ar) - the results are based on the responses to a survey distributed worldwide academics from a number of different sources. It not only illuminates the quality of the research, but the strength of the university in communicating that research, and the strength of the impact the research makes across the world. In the overall ranking, academic reputation carries the most weight at 40%.

- Employer Reputation(er) - the results are based on the responses to a survey distributed worldwide employers from a number of different sources. It is unique amongst current international evaluations in taking into consideration the important component of employment. In the overall ranking, employer reputation carries the second most weight at 10%.

- Faculty/Student Ratio(fsr) - the ratio of faculty members to students. It is a measure of the learning and teaching environment of the institution. In the overall ranking, faculty/student ratio carries the third most weight at 20%.
  
- Citations per Faculty(cpf) - the number of citations per faculty member. It is a measure of relative intensity and volume of research being done at an institute,taking into account institute size. In the overall ranking, citations per faculty carries the fourth most weight at 20%.

- International Faculty Ratio(ifr) - the proportion of faculty members that are international. It is a measure of the international diversity of the faculty. In the overall ranking, international faculty ratio carries the fifth most weight at 5%.

- International Student Ratio(isr) - the proportion of students that are international. It is a measure of the international diversity of the student body. In the overall ranking, international student ratio carries the sixth most weight at 5%.



# Description of the methods or models in this report
## Principle Component Analysis


## Factor Analysis

### Factor Extraction
We use the factor analysis to extract the common factors from the indicators. The factor analysis is a statistical method used to describe variability among observed, correlated variables in terms of a potentially lower number of unobserved variables called factors. For example, it is possible that variations in six observed variables mainly reflect the variations in two unobserved variables. Factor analysis searches for such joint variations in response to unobserved latent variables. The observed variables are modelled as linear combinations of the potential factors, plus "error" terms. Factor analysis aims to find independent latent variables. Models with various degrees of independency can be studied.

First we use the first 240 universities and standardize each variables. And then do the barlett inference and the p-value is extremely small($10^{-70}$), which means that there are correlations among the variables.Next, we need to examine how many factors should be extracted. Here we just do a spectral decomposition of the sample variance matrix and plot the eigenvalues.%[graph]% And we find that the first four eigenvalues can explain 90% of the total variance. So we choose the first four factors. Then we use the principal component method to extract the factors. The loadings in in the %[tableA.1]%. The communalities in the %[tableA.2]%. The total variance explained by the four factors is 90.5%.

### Factor Explanation
The visualization of loading matrix is shown in the %[graph]%. We can explain it according to the bigger value of each factor.

First factor lands big values on ifr and isr, which means that the first factor is about the international diversity.

Second factor have big values on ar and er, which means that the overall reputation.

Third factor have big values on fsr, which means that the learning and teaching environment.

Fourth factor have big values on cpf, which means the overall research level considering the institute size.

### Calculate the score of each University
We use the factor score to represent the score of each university. The factor score is calculated by the following formula:

$$
\text{socre}_j = \sum_{i=1}^{m} \frac{v_i}{k} \times Z_{ij}
$$

where $v_i = \sum_{i=1}^{p} c_{ij}^2$ is the variance explained by the $i$ the factor, $c_{ij}$ is the $ij$-entry of the loading matrix after rotation, $k = v_1 + v_2 + \cdots + v_m$ and $Z_{ij}$ is the value of the $i$ the factor of the $j$ the university.

The score essentially is the weighted mean of the common factor values and the weight is the variance explained by the factor(or the contribution rate).

### Get the new rank of the universities
Based on the new score, we can get the new rank of the universities. We can see the new rank is different from the origninal rank.

### K-means Result Analysis

First we use the elbow method to select the number of clusters, here we plot the elbow curve in the %[graph]%. We can see that the elbow is at 5, so we choose 5 as the number of clusters.

Then we first cluster the data with the original variables and examine the variable score of cluster center of each group, the result is shown in the %[graph]% but it is hard to explain the difference, this is because the variables are not independent. So we use the factor score to cluster the data and the result is shown in the %[graph]%. We can see that the difference is more obvious. 
As we can see, the third group has high score on all the factors, and it contains almost top 50 of the original ranking. We can define them as "Comprehensive strong school"
The fourth group has high score on learning and teaching environment and overall research level and relative low score on overall reputation and international diversity, which means that those institutions have strong academic strength and their learning atmosphere is very good, but they need to expand their international visibility, we can define it as "Small minority strong school". For example, the Southern University of Science and Technology is a young university, so it is not well known internationally, but it has a very good learning atmosphere and the overall research level is very high.
And the second group has very high score on international diversity and relative low score on other factors especially learning and teaching environment, which means that those institutions accept a wide range of foreign students and their learning is relatively easy. These institutions are mainly from the UK and Australia. We can define these institutions as "Relaxed International School". 
The fifth group has high score on the overall reputation and learning/teaching environment but low score on international diversity and overall research level, which means that their standard of teaching is very high and the students who go out from them are very good. It may be because of location and admissions policy, they have relatively low international diversity and have limited resources to conduct research. And they are mostly from germany, and as we all know, German schools are known for strict teaching. So we can define these kind of institution as "Local Elite School". 
The first group has high score on overall reputation and overall research level which means they are well known for their research such as UT Austin, UIUC, and GaTech. We can define these kind of institution as "Research Elite School".



## Cluster Analysis - K-means

### Introduction of K-means

K-means clustering is a method of vector quantization, originally from signal processing, that aims to partition n observations into k clusters in which each observation belongs to the cluster with the nearest mean, serving as a prototype of the cluster. This results in a partitioning of the data space into Voronoi cells. K-means can be conduct by the following steps:
1. Select $k$ points as the initial cluster centers.
2. Assign each point to the cluster with the nearest center.
3. Update the cluster centers by taking the average of the assigned points.
4. Repeat step 2 and 3 until the cluster centers do not change.

### How to select K
We use the elbow method to select the number of clusters. The elbow method is a method of interpretation and validation of consistency within cluster analysis designed to help finding the appropriate number of clusters in a dataset. If the line chart looks like an arm, then the "elbow" on the arm is the value of k that is the best. The "elbow" is the point of inflection on the curve.

And we use the silhouette score to evaluate the clustering result. The silhouette value is a measure of how similar an object is to its own cluster (cohesion) compared to other clusters (separation). And it can be calculated by the following formula:
$$
s(i) = \frac{b(i) - a(i)}{\max\{a(i), b(i)\}}
$$
where $a(i)$ is the average distance between $i$ and all other data within the same cluster, $b(i)$ is the average distance between $i$ and all other data points in the next nearest cluster. The silhouette ranges from −1 to +1, where a high value indicates that the object is well matched to its own cluster and poorly matched to neighboring clusters. If most objects have a high value, then the clustering configuration is appropriate. If many points have a low or negative value, then the clustering configuration may have too many or too few clusters.

# Empirical Analysis
## Data Acquisition and Description


## Analysis steps and results summary


## Verification of results - Comparing to the 

# Visualization(WebApp)

# Conclusion

# Appendix



