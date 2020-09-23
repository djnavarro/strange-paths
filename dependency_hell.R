# An simple illustration showing how dependencies can
# break reproducibility when the RNG state is global

# someone else's package includes this inefficient function
pick_name <- function() {
  names <- c("Dax", "Wug", "Lep", "Sik", "Bop")
  sample(names)[1]
}

# here is my code that calls it...
set.seed(100)
print("--- Attempt 1 ---")
print(pick_name()) # Wug
print(pick_name()) # Dax
print(pick_name()) # Sik

# it is reproducible...
set.seed(100)
print("--- Attempt 2 ---")
print(pick_name()) # Wug
print(pick_name()) # Dax
print(pick_name()) # Sik

# now the developer pushes a new and improved version
pick_name <- function() {
  names <- c("Dax", "Wug", "Lep", "Sik", "Bop")
  sample(names, size = 1)
}

# my output is no longer reproducible...
set.seed(100)
print("--- Attempt 3 ---")
print(pick_name()) # Wug
print(pick_name()) # Lep
print(pick_name()) # Dax

