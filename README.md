# Práctica 2 - Sistema de Gestión de Venta de Vehículos

## Descripción
Sistema desarrollado en Prolog para gestionar un catálogo de vehículos con funcionalidades de consulta, filtrado y generación de reportes.

## Características
- **Catálogo de vehículos**: 15 vehículos con marcas Toyota, Ford, BMW, Chevrolet, Honda, Nissan y Mercedes
- **Filtros avanzados**: Por marca, tipo, presupuesto y rango de años
- **Generación de reportes**: Reportes estructurados con restricciones presupuestarias
- **Casos de prueba**: Implementación de 3 casos específicos según los requisitos

## Estructura del Código

### Predicados Principales
- `vehicle(Marca, Referencia, Tipo, Precio, Año)` - Base de datos de vehículos
- `meet_budget(Referencia, PresupuestoMax)` - Filtro por presupuesto
- `generate_report(Marca, Tipo, Presupuesto, Resultado)` - Reporte principal
- `vehicles_by_brand(Marca, Vehículos)` - Vehículos por marca
- `vehicles_by_type(Tipo, Vehículos)` - Vehículos por tipo

### Casos de Prueba
1. **Caso 1**: Toyota SUV bajo $30,000
2. **Caso 2**: Vehículos Ford agrupados por tipo y año (usando `bagof/3`)
3. **Caso 3**: Valor total de sedanes sin exceder $500,000

## Uso

### Cargar el archivo
```bash
swipl practica2.pl
```

### Ejemplos de consultas
```prolog
% Caso 1: Toyota SUV bajo $30,000
?- case1_toyota_suv_under_30k(Result).

% Caso 2: Vehículos Ford por tipo y año
?- case2_ford_by_type_year(Result).

% Caso 3: Sedanes bajo $500,000
?- case3_sedan_total_under_500k(Total, Vehicles).

% Filtrar por presupuesto
?- meet_budget(rav4, 30000).

% Generar reporte personalizado
?- generate_report(toyota, suv, 35000, Result).
```

## Funcionalidades Adicionales
- `most_expensive_by_brand/3` - Vehículo más caro por marca
- `vehicles_by_year_range/3` - Filtro por rango de años
- `count_by_type/2` - Conteo de vehículos por tipo

## Requisitos
- SWI-Prolog 7.0 o superior

## Autores
- [Tu nombre]
- [Nombre del compañero]

## Curso
ST0244 - Lenguajes de Programación  
Universidad EAFIT