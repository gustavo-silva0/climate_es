# Geospatial Climate Analysis & Agricultural Suitability (Espírito Santo, Brazil) 🌍☕

## 💡 Motivation & Background
The state of Espírito Santo possesses a unique topographical diversity that directly influences its agricultural potential, especially for coffee production. This project was born from the desire to understand how altitude dictates temperature patterns across our municipalities. By combining data science with geospatial intelligence, I aimed to create a tool that not only maps the current climate but also simulates future scenarios, providing insights for sustainable agriculture and regional planning.

## 📝 Project Overview
This project focuses on modeling climate variables across the state of Espírito Santo, Brazil. By integrating meteorological data with high-resolution elevation models, I developed a spatial analysis to estimate annual mean temperatures and identify suitable regions for Arabica and Conilon coffee production.

The study uses the **Adiabatic Lapse Rate** to correlate altitude and temperature, providing a detailed map of thermal environments in a state with complex topography.

---

## 🛠️ Tech Stack & Tools
* **Language:** Python (Pandas, Matplotlib, Seaborn, SQLAlchemy)
* **Database:** PostgreSQL with **PostGIS** extension
* **GIS Software:** QGIS (Map design and raster processing)
* **Data Source:** INMET, IBGE, and TOPODATA (INPE)

---

## 📂 Data Acquisition & Sources
Due to file size limitations, raw geospatial datasets (Rasters and GeoPackages) are not hosted in this repository. You can access the official data used in this project through the following links:

* **Digital Elevation Model (Raster):** Obtained from the [TOPODATA Project (INPE)](http://www.webmapit.com.br/inpe/topodata/).
* **Administrative Boundaries (Vector):** Municipal and State borders sourced from the [IBGE](https://www.ibge.gov.br/geociencias/cartografia/malhas-territoriais/).
* **Historical Climate Data:** Meteorological normals sourced from [INMET](https://portal.inmet.gov.br/).
* **Cartographic Support:** Reference lines (Equator and Tropics) provided by [Natural Earth](https://www.naturalearthdata.com/).
* **Technical Parameters:** Coffee suitability guidelines based on **Incaper/Embrapa** research.

The repository includes processed tabular data from INMET and reference vector lines from Natural Earth for immediate use. High-resolution Rasters and large GeoPackages are excluded due to size limits but can be sourced via the links below.

---

## 📊 Analysis & Visualizations

### 🗺️ Spatial Modeling (QGIS)
Below are the generated maps showing the climatic patterns of Espírito Santo based on altitude gradients:

| Annual Mean Temperature | Annual Precipitation |
|:---:|:---:|
| ![Temperature Map](output/temperature_map.png) | ![Precipitation Map](output/precipitation_map.png) |

### 📈 Business Insights
The data processed in PostGIS allowed us to categorize the state's territory for agricultural planning:

![Coffee Suitability](output/coffee_graphic_es.png)

*Figure 1: Distribution of municipalities by coffee variety suitability.*

![Thermal Distribution](output/temperature_distribuition_graphic.png)

*Figure 2: Frequency of municipalities within specific temperature ranges.*

---

## 🚀 How to Reproduce
To run this project locally, follow these steps:

1.  **Database Setup:** Execute the scripts in the `/sql` folder in your PostGIS instance:
    * `ddl.sql`: Creates the tables and spatial schema.
    * `dml.sql`: Handles data ingestion.
    * `querys.sql`: Business insights and climate simulations.
2.  **Environment:** Install the required Python libraries:
    ```bash
    pip install -r requirements.txt
    ```
3.  **Notebook Execution:** Open `notebooks/climate_es.ipynb`.
4.  **Secure Connection:** The notebook uses `getpass` for secure database authentication. When prompted, enter your local PostgreSQL credentials.

---

## 📊 Key Insights
* **Temperature Modeling:** Identified a strong negative correlation between altitude and temperature ($R^2$ analysis included in the notebook).
* **Agricultural Zoning:** Mapped specific zones where the temperature ($18°C$ to $22°C$) and altitude ($> 450m$) favor high-quality Arabica coffee.
* **Climate Change Simulation:** A query-based simulation of a $2°C$ global temperature increase shows a significant reduction in "cold-climate" municipalities in the state.

---
**Developed by [Seu Nome]** *Geospatial Data Science & Climate Analysis*