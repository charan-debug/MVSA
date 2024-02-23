# Generating a 15x2 matrix of positive random integers
data <- matrix(sample(1:10, 15*2, replace = TRUE), nrow = 15, ncol = 2)
print("Generated Data:")
print(data)

# Using built-in functions
# Variance
variance_builtin <- apply(data, 2, var)

# Covariance matrix
covariance_matrix_builtin <- cov(data)

# Correlation matrix
correlation_matrix_builtin <- cor(data)

#---------------------------------------

# Manual calculations
# Calculate the means
mean_x <- mean(data[, 1])
mean_y <- mean(data[, 2])

# Number of observations
n <- nrow(data)

# Compute the sample variance for variable X
var_x <- sum((data[, 1] - mean_x)^2) / (n - 1)

# Compute the sample variance for variable Y
var_y <- sum((data[, 2] - mean_y)^2) / (n - 1)

# Compute the sample covariance matrix
scaling_factor <- 1 / (n - 1)
covariance_matrix_manual <- scaling_factor * t(data - c(mean_x, mean_y)) %*% (data - c(mean_x, mean_y))

# Compute the correlation matrix
std_dev_x <- sqrt(var_x)
std_dev_y <- sqrt(var_y)
correlation_matrix_manual <- covariance_matrix_manual / (std_dev_x * std_dev_y)

#-----------------------

# Output
print("Results from Built-in Functions:")
print("Variance:")
print(variance_builtin)
print("Covariance Matrix:")
print(covariance_matrix_builtin)
print("Correlation Matrix:")
print(correlation_matrix_builtin)

print("Results from Manual Calculations:")
print("Variance:")
print(c(var_x, var_y))
print("Covariance Matrix:")
print(covariance_matrix_manual)
print("Correlation Matrix:")
print(correlation_matrix_manual)

