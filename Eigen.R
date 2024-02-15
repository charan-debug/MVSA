# Define the matrix

A <- matrix(c(1,4,7,2,5,8,3,6,9),nrow=3,ncol=3)
A

# Compute eigenvalues and eigenvectors
eigenvalues_and_vectors <- eigen(A)

# Extract eigenvalues
eigenvalues <- eigenvalues_and_vectors$values

# Extract eigenvectors
eigenvectors <- eigenvalues_and_vectors$vectors

# Print results
cat("Eigenvalues:\n")
print(eigenvalues)

cat("\nEigenvectors:\n")
print(eigenvectors)

# Normalize each eigenvector by dividing by its length
normalized_eigenvectors <- t(apply(eigenvectors, 1, FUN = function(v) v / sqrt(sum(v^2))))

# Print results
cat("Normalized Eigenvectors:\n")
print(normalized_eigenvectors)
