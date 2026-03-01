# Show all available datasets
data(package = .packages(all.available = TRUE))

# Load ggplot2
library(ggplot2)

# Load diamonds dataset
data(diamonds)

# Structure and dimensions
str(diamonds)
dim(diamonds)

# Help page
?diamonds

# Basic scatter plot
plot(diamonds$carat, diamonds$price)

# Scatter plot with transparency
plot(diamonds$carat, diamonds$price,
     col = rgb(0, 0, 1, 0.1),
     pch = 16,
     main = "Scatter Plot: Carat vs Price")

# Install and load hexbin package
install.packages("hexbin")
library(hexbin)

# Hexbin using hexbin package
hb <- hexbin(diamonds$carat, diamonds$price, xbins = 40)
plot(hb, main = "Hexbin Plot")

# Hexbin using ggplot2
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex()

# With labels and theme
ggplot(diamonds, aes(carat, price)) +
  geom_hex() +
  labs(title = "Hexagon Binning: Diamond Structure",
       x = "Carat",
       y = "Price") +
  theme_minimal()

# Gradient color version (Corrected)
ggplot(diamonds, aes(carat, price)) +
  geom_hex(bins = 30) +
  scale_fill_gradient(low = "lightgreen", high = "red") +
  theme_minimal()

# Viridis color scale
ggplot(diamonds, aes(carat, price)) +
  geom_hex(bins = 35) +
  scale_fill_viridis_c(name = "Count") +
  theme_minimal()

# Adding title and legend name
ggplot(diamonds, aes(carat, price)) +
  geom_hex(bins = 20) +
  scale_fill_viridis_c(name = "Count") +
  labs(title = "Density Structure of Diamonds",
       x = "Carat",
       y = "Price") +
  theme_minimal()

# Faceted by cut
ggplot(diamonds, aes(carat, price)) +
  geom_hex() +
  scale_fill_viridis_c() +
  facet_wrap(~cut) +
  theme_minimal()