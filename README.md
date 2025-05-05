# 🧠  Women's Bargaining Power and Its Impact on Children's Education Outcomes

This paper studies the role of women’s bargaining power on children’s outcomes through the lens of intergenerational education correlations.

---

### 🔍 Key Findings

- **Maternal Education:** Increased women’s bargaining power strengthens the influence of maternal education on children's educational outcomes.
- **Paternal Education:** Simultaneously, it weakens the impact of paternal education, highlighting the changing dynamics in family education roles.
- **Gender Disparities:** The study shows that these changes are particularly beneficial for daughters, with a modest increase in children's overall education levels.
- **Contextual Influence:** The effects of women’s bargaining power are more pronounced in contexts with higher gender inequality and negative gender norms, as well as in families where fathers have lower education levels.

---

## 📚 Dataset and Methodology

- **Data:** The analysis is based on micro-level data spanning 20 European countries and Israel, incorporating information about family dynamics, parental education levels, and children's outcomes.   
  - Survey of Health, Ageing and Retirement in Europe (SHARE) - Waves 1 to 7   
  - SHARE project --> Jop Episode Panel   
- **Methodology:** The study applies econometric techniques to explore the relationship between women’s bargaining power and educational outcomes, controlling for various socioeconomic factors and gender norms.
- 
---

## 📂 Repository Structure

1. **`database_creation_parents.do`**: Identifies parents' demographics
2. **`years_schooling.do`**: Imputes years of schooling based on ISCED
3. **`database_childw'x'.do`**: Identifies respondents' children
4. **`variable_creation_child.do`**: Combines information from several waves to produce final variables
5. **`job_history_parents.do`**: Combines child age with parents' job histories
6. **`job_episode.do`**: Creates the main dataset to produce age-earning profiles
7. **`job_episode_country.do`**: Estimates parental wage income using age-earning profiles
8. **`family_background.do`**: Constructs family background characteristics
9. **`main_dataset.do`**: Produces the master dataset
10. **`results.do`**: Reports tables
11. **`figures.do`**: Reports figures

---

## 📜 Citation

- [Author(s)], *Title of the Paper*. Year. **Publisher/Journal**. 
- **Aknowledgements:** This study uses data from SHARE Waves 1, 2, 3, 4, 5, 6, 7 and the generated Job Episodes Panel (DOIs:10.6103/SHARE.w1.710, 10.6103/SHARE.w2.710, 10.6103/SHARE.w3.710, 10.6103/SHARE.w4.710, 10.6103/SHARE.w5.710, 10.6103/SHARE.w6.710, 10.6103/SHARE.w7.710, 10.6103/SHARE.jep.710), see Börsch-Supan et al. (2013) and Brugiavini et al. (2019) for methodological details. 

For more detailed information, please refer to the full paper or contact the authors.
