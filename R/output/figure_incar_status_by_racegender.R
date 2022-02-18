# Builds a bar graph with total arrests on the y axis and race/gender on the
# x axis. Refer to my presentation on graphing for more detail.

read_csv(here("/Users/jonathanbowman/Desktop/Repos/Causal/causal-inference-2022/data/NLSY97_clean.csv")) %>%
  group_by(race, gender) %>%
  summarize(total_incarcerated = sum(incar_status)) %>%
  ggplot(aes(race, total_incarcerated, fill = gender)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(
      x = "Race", 
      y = "Total Incarceration", 
      fill = "Gender",
      title = "Total Incarcerated in 2002 by Race and Gender") +
    theme_minimal() +
    scale_fill_economist()

ggsave(here("figures/incarcerated_by_racegender.png"), width=8, height=4.5)
