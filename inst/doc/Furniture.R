## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(furniture)

## ----data----------------------------------------------------------------
df <- data.frame(a = rnorm(1000, 1.5, 2), 
                 b = seq(1, 1000, 1), 
                 c = c(rep("control", 400), rep("Other", 70), rep("treatment", 500), rep("None", 30)),
                 d = c(sample(1:1000, 900, replace=TRUE), rep(-99, 100)))

## ----washer, message=FALSE, warning=FALSE--------------------------------
library(tidyverse)

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
       type = c("simple", "condensed"))

## ----table1.5------------------------------------------------------------
table1(df, a, b, d, ifelse(a > 1, 1, 0),
       splitby=~factor(c), 
       test=TRUE,
       var_names = c("A", "B", "D", "New Var"),
       format_number = TRUE)

## ----table1.6, eval=FALSE------------------------------------------------
#  table1(df, a, b, d, ifelse(a > 1, 1, 0),
#         splitby=~factor(c),
#         test=TRUE,
#         var_names = c("A", "B", "D", "New Var"),
#         format_number = TRUE,
#         export = "example_table1")

## ----table1.7------------------------------------------------------------
table1(df, a, b, d, ifelse(a > 1, 1, 0),
       splitby=~factor(c), 
       test=TRUE,
       var_names = c("A", "B", "D", "New Var"),
       output = "latex")

## ----simple_table1.1-----------------------------------------------------
table1(df, a, b, d, ifelse(a > 1, 1, 0),
       splitby=~factor(c), 
       test=TRUE,
       var_names = c("A", "B", "D", "New Var"),
       type = c("simple", "condensed"))

