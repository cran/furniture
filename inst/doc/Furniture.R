## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(furniture)

## ----data----------------------------------------------------------------
df <- data.frame(a = rnorm(100, 1.5, 2), 
                 b = seq(1, 100, 1), 
                 c = c(rep("control", 40), rep("Other", 7), rep("treatment", 50), rep("None", 3)),
                 d = c(sample(1:1000, 90, replace=TRUE), rep(-99, 10)))

## ----washer--------------------------------------------------------------
library(dplyr)

df <- df %>%
  mutate(d = washer(d, -99),  ## changes the placeholder -99 to NA
         c = washer(c, "Other", "None", value = "control")) ## changes "Other" and "None" to "Control"

## ----table1--------------------------------------------------------------
table1(df, a, b, factor(c), d)

## ----table1.2------------------------------------------------------------
table1(df, a, b, d, ifelse(a > 1, 1, 0))

## ----table1.3------------------------------------------------------------
table1(df, a, b, d, ifelse(a > 1, 1, 0),
       splitby=~factor(c), 
       test=TRUE)

## ----table1.4------------------------------------------------------------
table1(df, a, b, d, ifelse(a > 1, 1, 0),
       splitby=~factor(c), 
       test=TRUE,
       var_names = c("A", "B", "D", "New Var"),
       splitby_labels = c("Control", "Treatment"))

## ----table1.5------------------------------------------------------------
table1(df, a, b, d, ifelse(a > 1, 1, 0),
       splitby=~factor(c), 
       test=TRUE,
       var_names = c("A", "B", "D", "New Var"),
       splitby_labels = c("Control", "Treatment"),
       output_type = "latex")

