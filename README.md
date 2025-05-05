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

1. **`master.do`**: Runs all the individual `.do` files in the correct sequence to reproduce the full analysis.
2.  **`database_creation_parents.do`**: Identifies parents' demographics
3. **`years_schooling.do`**: Imputes years of schooling based on ISCED
4. **`database_childw'x'.do`**: Identifies respondents' children
5. **`variable_creation_child.do`**: Combines information from several waves to produce final variables
6. **`job_history_parents.do`**: Combines child age with parents' job histories
7. **`job_episode.do`**: Creates the main dataset to produce age-earning profiles
8. **`job_episode_country.do`**: Estimates parental wage income using age-earning profiles
9. **`family_background.do`**: Constructs family background characteristics
10. **`main_dataset.do`**: Produces the master dataset
11. **`results.do`**: Reports tables
12. **`figures.do`**: Reports figures

---

## 📂 Input Data Sources

### 1. SHARE Datasets (Release 7.1.0)

Access to the following datasets can be requested from: [https://share-eric.eu](https://share-eric.eu)
- **Aknowledgements:** This study uses data from SHARE Waves 1, 2, 3, 4, 5, 6, 7 and the generated Job Episodes Panel (DOIs:10.6103/SHARE.w1.710, 10.6103/SHARE.w2.710, 10.6103/SHARE.w3.710, 10.6103/SHARE.w4.710, 10.6103/SHARE.w5.710, 10.6103/SHARE.w6.710, 10.6103/SHARE.w7.710, 10.6103/SHARE.jep.710), see Börsch-Supan et al. (2013) and Brugiavini et al. (2019) for methodological details. 

<details>
<summary><strong>Wave 1</strong></summary>

- `sharew1_rel7-1-0_ch` – Children questionnaire  
- `sharew1_rel7-1-0_dn` – Respondents' demographics  
- `sharew1_rel7-1-0_gv_isced` – ISCED education levels  
- `sharew1_rel7-1-0_technical_variables` – Main identifiers, country info  
</details>

<details>
<summary><strong>Wave 2</strong></summary>

- `sharew2_rel7-1-0_ch`  
- `sharew2_rel7-1-0_dn`  
- `sharew2_rel7-1-0_gv_isced`  
- `sharew2_rel7-1-0_technical_variables`  
</details>

<details>
<summary><strong>Wave 3</strong></summary>

- `sharew3_rel7-1-0_ch`  
- `sharew3_rel7-1-0_dn`  
- `sharew3_rel7-1-0_gv_isced`  
- `sharew3_rel7-1-0_technical_variables`  
</details>

<details>
<summary><strong>Wave 4</strong></summary>

- `sharew4_rel7-1-0_ch`  
- `sharew4_rel7-1-0_dn`  
- `sharew4_rel7-1-0_gv_isced`  
- `sharew4_rel7-1-0_technical_variables`  
</details>

<details>
<summary><strong>Wave 5</strong></summary>

- `sharew5_rel7-1-0_ch`  
- `sharew5_rel7-1-0_dn`  
- `sharew5_rel7-1-0_gv_isced`  
- `sharew5_rel7-1-0_technical_variables`  
</details>

<details>
<summary><strong>Wave 6</strong></summary>

- `sharew6_rel7-1-0_ch`  
- `sharew6_rel7-1-0_gv_children`  
- `sharew6_rel7-1-0_dn`  
- `sharew6_rel7-1-0_gv_isced`  
- `sharew6_rel7-1-0_technical_variables`  
</details>

<details>
<summary><strong>Wave 7</strong></summary>

- `sharew7_rel7-1-0_ch`  
- `sharew7_rel7-1-0_dn`  
- `sharew7_rel7-1-0_gv_isced`  
- `sharew7_rel7-1-0_technical_variables`  
</details>

<details>
<summary><strong>All Waves</strong></summary>

- `sharewX_rel7-1-0_gv_allwaves_cv_r` – Cross-wave constructed variables  
- `sharewX_rel7-1-0_gv_job_episodes_panel` – Job episode panel data  
</details>

---

### 2. External Datasets

The following datasets will be provided upon request. See *Appendix B* and the *Gender Norms* section of the paper for more details.

- `CPI_historical.dta` – Historical consumer price index  
- `Exchange_rate_historical.dta` – Historical exchange rates  
- `Gender_norms.dta` – Gender inequality index and imputed gender norms  
- `part_time_correction_rates.dta` – Full-time / part-time correction rates for wage imputation  
- `Country_population.dta` – Population data used to construct weights  

## 📜 Citation
- Aydemir, Abdurrahman B., and Meliz Tyurkileri. 2024. Maternal Bargaining Power and Intergenerational Education Mobility [unpublished manuscript].
  
For more detailed information, please refer to the full paper or contact the authors.
