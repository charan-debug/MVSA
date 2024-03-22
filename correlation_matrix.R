#Loading Dataset
dataset = read.csv("Walmart.csv")
df = subset(dataset, select = -c(Store, Date)) 
df_2 = dataset[-c(51:6435)]

matrix = as.matrix(df_2)
dim(matrix)

# Variance-Covariance Matrix for the matrix
nrows = nrow(matrix)
ncols = ncol(matrix)

one = matrix(c(rep(1,nrows)), nrow=nrows, ncol=nrows)

m = matrix - (one %*% (matrix/nrows))

m = t(m) %*% m
V = m/nrows
V
print("Cross-Verification with the cov() function:")
cov(matrix)

# Correlation Matrix
print("The square_root matrix is: ")
sqrt_matrix = diag(1/sqrt(diag(V)))
corr_matrix = sqrt_matrix %*% V %*% sqrt_matrix
print("The correlation matrix is: ")
corr_matrix

#Confirmation with cor() function
cor(matrix)


#Inferences
#1. Weekly_Sales is positively correlated to all features, except temperature.
#   This might tell us that as the temperature increases, people are more likely to stay inside and 
#   not go for shopping.

#2.  Weekly_Sales is positively correlated to Holidays, since more people will go
#   outside during holidays for shopping.

#3. Consumer Price Index is one of the measures for inflation.
#   We can see that CPI and unemployment are negatively correlated.
#   This is because if unemployment is low, employers typically need to pay 
#   leading to rising in wage inflation.
