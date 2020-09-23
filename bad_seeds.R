# Two pseudorandom functions that give the same output given
# the same RNG state, but leave the RNG in different states

# version 1 of the function
pick_name1 <- function() {
  names <- c("Dax", "Wug", "Lep", "Sik", "Bop")
  sample(names)[1]
}

# version 2 of the function
pick_name2 <- function() {
  names <- c("Dax", "Wug", "Lep", "Sik", "Bop")
  sample(names, size = 1)
}

# set up
ntries <- 100
seeds <- sample(ntries)
names_equal_a <- logical(length = ntries)
names_equal_b <- logical(length = ntries)

for(i in 1:ntries) {
  set.seed(seeds[i]) # set the seed to a fixed value
  name1a <- pick_name1()
  name1b <- pick_name1()

  set.seed(seeds[i]) # reset the seed to the SAME fixed value
  name2a <- pick_name2()  # name 2a this is the same as name 1a...
  name2b <- pick_name2()  # ... BUT name 2b is different from name 1b

  names_equal_a[i] <- name1a == name2a
  names_equal_b[i] <- name1b == name2b
}
print(all(names_equal_a)) # returns TRUE
print(all(names_equal_b)) # returns FALSE
