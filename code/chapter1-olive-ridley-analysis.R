# =============================================================================
# CHAPTER 1: Olive Ridley Arribada Pattern Analysis
# From "Thinking Like a Biologist with Data"
# =============================================================================

# Load required packages
library(tidyverse)
library(ggplot2)

# Create example olive ridley data (similar to Dr. Sharma's Gahirmatha data)
olive_ridley <- data.frame(
  year = 2008:2025,
  nesting_count = c(420000, 380000, 280000, 510000, 250000, 480000, 
                   560000, 310000, 420000, 480000, 380000, 520000,
                   450000, 490000, 380000, 460000, 520000, 580000),
  cyclone_intensity = c(2, 1, 4, 1, 3, 1, 0, 2, 1, 1, 2, 1, 2, 1, 3, 1, 1, 0),
  fishing_effort = c(850, 920, 880, 760, 840, 720, 450, 680, 750, 700, 
                    780, 680, 720, 650, 740, 680, 650, 620)
)

# Basic time series visualization
ggplot(olive_ridley, aes(x = year, y = nesting_count)) +
  geom_line(color = "darkgreen", size = 1.2) +
  geom_point(color = "darkgreen", size = 3) +
  labs(title = "Olive Ridley Nesting Patterns at Gahirmatha",
       subtitle = "15-year arribada data showing natural variation",
       x = "Year", y = "Nesting Count") +
  theme_minimal()

# Correlation analysis (as discussed in Chapter 1)
cor.test(olive_ridley$nesting_count, olive_ridley$fishing_effort)
cor.test(olive_ridley$nesting_count, olive_ridley$cyclone_intensity)

# Summary statistics
summary(olive_ridley$nesting_count)
sd(olive_ridley$nesting_count)

# Calculate coefficient of variation
cv <- sd(olive_ridley$nesting_count) / mean(olive_ridley$nesting_count) * 100
cat("Coefficient of Variation:", round(cv, 1), "%")
