matrix_input <- function(n) {
  # Initialize an empty matrix to store the input
  matrix_input = matrix(nrow = n, ncol = n)
  
  # Loop over each row
  for (i in 1:n) {
    cat("Enter values for row", i, ": ")
    row_input <- readline()
    
    row_values <- as.numeric(unlist(strsplit(row_input, " ")))   # Split the input string into individual values
    
    if (length(row_values) != n) {
      cat("Invalid number of values entered. Please enter", n , "values.\n")
      i <- i - 1
    } else {
      # Store the values in the matrix
      matrix_input[i, ] <- row_values
    }
  }
  
  return(matrix_input)
}

cat("Enter the dimension of matrix: ")
n <- as.numeric(readline())

# Take matrix input
M <- matrix_input(n)

# Print the input matrix
print("Matrix:")
print(M)

# getting eigen values and eigen vectors
eigen_data = eigen(M)

# note: eigen(M) handles repeated eigen values internally, so eigen vectors are not repeated.

# getting squareroot of eigen values for lambda^-1
sqrt_eigvals = sqrt(eigen_data$values)

# constructing lambda (diagonal matrix)
lambda = diag(sqrt_eigvals)

# calculating squareroot matrix
sqrt_M = eigen_data$vectors %*% lambda %*% solve(eigen_data$vectors)

print("Square root of M:")
print(sqrt_M)
