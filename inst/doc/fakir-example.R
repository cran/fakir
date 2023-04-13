## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.align = "center"
)

## ---- message=FALSE-----------------------------------------------------------
library(fakir)
library(dplyr)
library(ggplot2)
library(sf)

## -----------------------------------------------------------------------------
fake_ticket_client(vol = 10)

## -----------------------------------------------------------------------------
tickets_db <- fake_ticket_client(vol = 100, split = TRUE)
tickets_db

## -----------------------------------------------------------------------------
ggplot(tickets_db$clients) +
  aes(x = entry_date, y = fidelity_points) +
  geom_point() +
  geom_smooth()
ggplot(tickets_db$tickets) +
  aes(x = type) +
  geom_bar()
ggplot(tickets_db$tickets) +
  aes(x = state) +
  geom_bar()

## -----------------------------------------------------------------------------
clients_map <- tickets_db$clients %>%
  group_by(id_dpt) %>%
  summarise(
    number_of_clients = n(),
    average_fidelity = mean(fidelity_points, na.rm = TRUE)
  ) %>%
  full_join(fra_sf, by = "id_dpt") %>%
  st_sf()

ggplot(clients_map) +
  geom_sf(aes(fill = average_fidelity)) +
  scale_fill_viridis_c() +
  coord_sf(
    crs = 2154,
    datum = 4326
  )

## -----------------------------------------------------------------------------
count(
  fake_products(10),
  category
)

## -----------------------------------------------------------------------------
fake_visits(
  from = "2017-01-01",
  to = "2017-01-31"
)

## -----------------------------------------------------------------------------
fake_survey_answers(n = 10)

## -----------------------------------------------------------------------------
fake_survey_answers(n = 10, split = TRUE)

## -----------------------------------------------------------------------------
answers <- fake_survey_answers(n = 30)
answers

ggplot(answers) +
  aes(age, log(distance_km), colour = type) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~type, scales = "free_y")

