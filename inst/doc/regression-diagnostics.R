## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  echo = TRUE,
  warning = FALSE,
  message = FALSE,
  fig.width = 7,
  fig.height = 5.5,
  dpi = 72
)

## ----model--------------------------------------------------------------------
library(snazzieR)

model <- lm(mpg ~ wt + hp, data = mtcars)

## ----diagnostics--------------------------------------------------------------
diagnostics.plots(model)

## ----qq, fig.width = 4.5, fig.height = 3.5------------------------------------
diagnostics.plots(model)$plots$qq

## ----mmp----------------------------------------------------------------------
marginal.model.plots(model, title = "Marginal Model Plots: Fuel Economy")

## ----unusual------------------------------------------------------------------
unusual.points.table(model, latex = FALSE, id = rownames(mtcars))

## ----unusual-narrow-----------------------------------------------------------
unusual.points.table(
  model,
  latex = FALSE,
  id = rownames(mtcars),
  flag = c("leverage", "outlier"),
  n.max = 3
)

## ----vif----------------------------------------------------------------------
bigger <- lm(mpg ~ wt + hp + disp + qsec, data = mtcars)
VIF.table(bigger, latex = FALSE)

## ----vif-factor---------------------------------------------------------------
VIF.table(lm(mpg ~ wt + hp + factor(cyl), data = mtcars), latex = FALSE)

## ----vif-cols-----------------------------------------------------------------
VIF.table(bigger, latex = FALSE, cols = c("VIF", "1/VIF"))

