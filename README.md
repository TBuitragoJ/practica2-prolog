# 🚗 Sistema de Gestión de Venta de Vehículos en Prolog

Un sistema completo para la gestión y consulta de un catálogo de vehículos, implementado en **Prolog**, que permite aplicar filtros avanzados, generar reportes estructurados y resolver consultas específicas sobre automóviles.

---

## 🤖 Notas de desarrollo y herramientas utilizadas

- El desarrollo del código fuente se realizó en **SWI-Prolog**.
-  Se utilizó **Claude** (IA) para asistir en la subida del código al repositorio y en la creación de este README.
---

## 🚀 Características

- **Catálogo de 15 vehículos** con marcas: Toyota, Ford, BMW, Chevrolet, Honda, Nissan y Mercedes.
- **Filtros avanzados**: por marca, tipo, presupuesto y rango de años.
- **Generación de reportes** personalizados.
- **Casos de prueba** con consultas representativas.
- **Predicados auxiliares** para estadísticas y búsquedas.

---

## 📦 Predicados y Funcionalidades

- `vehicle(Marca, Referencia, Tipo, Precio, Año)` — Base de datos de vehículos.
- `meet_budget(Referencia, PresupuestoMax)` — Filtro por presupuesto.
- `generate_report(Marca, Tipo, Presupuesto, Resultado)` — Reporte personalizado.
- `vehicles_by_brand(Marca, Vehículos)` — Vehículos por marca.
- `vehicles_by_type(Tipo, Vehículos)` — Vehículos por tipo.
- `most_expensive_by_brand/3` — Vehículo más caro por marca.
- `vehicles_by_year_range/3` — Filtro por rango de años.
- `count_by_type/2` — Conteo de vehículos por tipo.

---

## 🧪 Casos de Prueba

1. **Toyota SUV bajo $30,000:**  
   ```prolog
   ?- case1_toyota_suv_under_30k(Result).
   ```
2. **Vehículos Ford agrupados por tipo y año:**  
   ```prolog
   ?- case2_ford_by_type_year(Result).
   ```
3. **Valor total de sedanes sin exceder $500,000:**  
   ```prolog
   ?- case3_sedan_total_under_500k(Total, Vehicles).
   ```

---

## 🛠️ Requisitos

- **SWI-Prolog** 7.0 o superior

---

## 🚦 Instalación y Ejecución

### 1. Clonar el repositorio

```bash
git clone https://github.com/TBuitragoJ/practica2-prolog.git
cd practica2-prolog
```

### 2. Cargar el archivo en SWI-Prolog

```bash
swipl practica2.pl
```

### 3. Ejecutar consultas de ejemplo

```prolog
?- meet_budget(rav4, 30000).
?- generate_report(toyota, suv, 35000, Result).
?- vehicles_by_brand(ford, Vehículos).
```

---

## 📋 Guía de Uso Paso a Paso

### Menú de Consultas Sugeridas

- **Filtrar por marca:**  
  `?- vehicles_by_brand(toyota, Resultado).`

- **Filtrar por tipo:**  
  `?- vehicles_by_type(suv, Resultado).`

- **Filtrar por presupuesto:**  
  `?- meet_budget(referencia, 30000).`

- **Generar reporte personalizado:**  
  `?- generate_report(marca, tipo, presupuesto, Resultado).`

- **Conteo por tipo:**  
  `?- count_by_type(suv, Cantidad).`

---

## 📁 Estructura del Proyecto

```
practica2-prolog/
├── practica2.pl         # Código fuente principal (Prolog)
├── README.md            # Este archivo
```

---

## 🏗️ Arquitectura y Tipos

### Predicados principales

- **Base de datos:** `vehicle/5`
- **Filtros:** `meet_budget/2`, `vehicles_by_brand/2`, `vehicles_by_type/2`
- **Reportes:** `generate_report/4`
- **Estadísticas:** `most_expensive_by_brand/3`, `count_by_type/2`

---

## 🐞 Resolución de Problemas

- **Error: comando no encontrado:**  
  Asegúrate de tener instalado SWI-Prolog (`sudo apt install swi-prolog`).

- **No carga el archivo:**  
  Verifica estar en el directorio correcto y que el archivo `practica2.pl` existe.
---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo `LICENSE` para más detalles.

---

## 👨‍💻 Autores

- **Tomás Buitrago** - [TBuitragoJ](https://github.com/TBuitragoJ)
- **[Nombre del compañero]**

---

¿Te resultó útil este proyecto? ¡Dale una ⭐ en GitHub!
