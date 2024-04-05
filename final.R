# Define the matrix 'a'
a <- matrix(c(1, 2, 1,
              2, 0, 3,
              1, 3, 4), nrow = 3, byrow = TRUE)

# Calculate eigenvalues and eigenvectors
eigen_result <- eigen(a)
eigenvalues <- eigen_result$values
eigenvectors <- eigen_result$vectors

print("Eigenvalues:")
print(eigenvalues)
print("Eigenvectors:")
print(eigenvectors)

# Function to set very small values to zero
set_to_zero <- function(x, threshold) {
  x[abs(x) < threshold] <- 0
  return(x)
}

# Compute dot products of eigenvectors
dot_product_12 <- sum(eigenvectors[, 1] * eigenvectors[, 2])
dot_product_13 <- sum(eigenvectors[, 1] * eigenvectors[, 3])
dot_product_23 <- sum(eigenvectors[, 2] * eigenvectors[, 3])

# Set very small dot products to zero
threshold <- 1e-15
dot_product_12 <- set_to_zero(dot_product_12, threshold)
dot_product_13 <- set_to_zero(dot_product_13, threshold)
dot_product_23 <- set_to_zero(dot_product_23, threshold)

# Verify orthogonality
is_orthogonal <- all(c(dot_product_12, dot_product_13, dot_product_23) == 0)


print("Are the eigenvectors exactly orthogonal?")
print(is_orthogonal)
