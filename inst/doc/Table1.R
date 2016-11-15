## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(furniture)

## ----structure, eval=FALSE-----------------------------------------------
#  table1(.data, ..., splitby, row_wise, test, output_type, format_output, format_number, NAkeep, piping, splitby_labels, var_names)

## ----data----------------------------------------------------------------
set.seed(84332)
## Create Ficticious Data containing several types of variables
df <- data.frame(a = rnorm(10000),
                 b = runif(10000) + rnorm(10000),
                 c = factor(sample(c(1,2,3,4), 10000, replace=TRUE)),
                 d = factor(sample(c(0,1), 10000, replace=TRUE)),
                 e = trunc(rnorm(10000, 20, 5)))

## ----simple--------------------------------------------------------------
table1(df, 
       a, b, c, d, e)

## ----splitby-------------------------------------------------------------
table1(df,
       a, b, c,
       splitby = ~d)

## ----rowwise-------------------------------------------------------------
table1(df,
       a, b, c,
       splitby = ~d,
       row_wise = TRUE)

## ----test----------------------------------------------------------------
table1(df,
       a, b, c,
       splitby = ~d,
       test = TRUE)

## ----html----------------------------------------------------------------
table1(df,
       a, b, c,
       splitby = ~d,
       test = TRUE,
       output_type = "html")

## ----formatnumber--------------------------------------------------------
table1(df,
       a, b, c,
       splitby = ~d,
       test = TRUE,
       format_number = TRUE)

## ----nakeep--------------------------------------------------------------
table1(df,
       a, b, c,
       splitby = ~d,
       test = TRUE,
       NAkeep = TRUE)

## ----tidyverse, fig.width=5----------------------------------------------
library(tidyverse)

df %>%
  table1(a, b, c,
         splitby = ~d,
         test = TRUE,
         piping = TRUE) %>%
  ggplot(aes(x = b, y = a, group = d)) +
    geom_point(aes(color = d), alpha =.25) +
    scale_color_manual(values = c("dodgerblue3", "chartreuse4"), name = "Group")

## ------------------------------------------------------------------------
table1(df,
       a, b, c,
       splitby = ~d,
       test = TRUE,
       splitby_labels = c("No", "Yes"),
       var_names = c("A", "B", "C"))

## ------------------------------------------------------------------------
table1(df,
       factor(ifelse(a > 1, 1, 0)), b, c,
       splitby = ~d,
       test = TRUE,
       splitby_labels = c("No", "Yes"),
       var_names = c("A", "B", "C"))

## ----dataframe-----------------------------------------------------------
tab1 = table1(df,
              a, b, c,
              splitby = ~d,
              test = TRUE)
data.frame(tab1)

