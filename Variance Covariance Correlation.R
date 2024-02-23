# Generating a 15x2 matrix of positive random integers
data <- matrix(sample(1:10, 15*2, replace = TRUE), nrow = 15, ncol = 2)
print(data)
# Variance
variance <- apply(data, 2, var)

# Covariance matrix
covariance_matrix <- cov(data)

# Correlation matrix
correlation_matrix <- cor(data)

# Output
print("Variance:")
print(variance)

print("Covariance Matrix:")
print(covariance_matrix)

print("Correlation Matrix:")
print(correlation_matrix)
