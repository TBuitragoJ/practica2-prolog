% PRÁCTICA 2 - PROGRAMACIÓN LÓGICA
% SISTEMA DE GESTIÓN DE VENTA DE VEHÍCULOS

% CATÁLOGO DE VEHÍCULOS
vehicle(toyota, rav4, suv, 28000, 2022).
vehicle(toyota, camry, sedan, 25000, 2023).
vehicle(toyota, highlander, suv, 35000, 2022).
vehicle(toyota, corolla, sedan, 22000, 2023).
vehicle(ford, mustang, sport, 45000, 2023).
vehicle(ford, f150, pickup, 40000, 2022).
vehicle(ford, explorer, suv, 33000, 2023).
vehicle(ford, fusion, sedan, 24000, 2022).
vehicle(bmw, x5, suv, 60000, 2021).
vehicle(bmw, series3, sedan, 42000, 2023).
vehicle(bmw, z4, sport, 55000, 2022).
vehicle(chevrolet, silverado, pickup, 38000, 2022).
vehicle(honda, accord, sedan, 26000, 2023).
vehicle(nissan, altima, sedan, 23000, 2022).
vehicle(mercedes, c_class, sedan, 45000, 2023).

% CONSULTAS BÁSICAS Y FILTROS

% Filtrar por presupuesto máximo
meet_budget(Reference, BudgetMax) :-
    vehicle(_, Reference, _, Price, _),
    Price =< BudgetMax.

% Listar vehículos por marca
vehicles_by_brand(Brand, Vehicles) :-
    findall(Reference, vehicle(Brand, Reference, _, _, _), Vehicles).

% Filtrar por tipo
vehicles_by_type(Type, Vehicles) :-
    findall(Reference, vehicle(_, Reference, Type, _, _), Vehicles).

% Filtrar por marca y tipo
vehicles_by_brand_type(Brand, Type, Vehicles) :-
    findall(Reference, vehicle(Brand, Reference, Type, _, _), Vehicles).

% GENERACIÓN DE REPORTES

% Reporte principal
generate_report(Brand, Type, Budget, Result) :-
    findall((Reference, Price), 
            (vehicle(Brand, Reference, Type, Price, _), Price =< Budget), 
            Result).

% Calcular valor total de inventario filtrado
total_inventory_value(Type, BudgetLimit, TotalValue, FilteredVehicles) :-
    findall(Price, vehicle(_, _, Type, Price, _), Prices),
    sum_list(Prices, Total),
    (Total =< BudgetLimit ->
        TotalValue = Total,
        findall((Brand, Reference, Price), vehicle(Brand, Reference, Type, Price, _), FilteredVehicles)
    ;
        filter_by_budget_limit(Type, BudgetLimit, TotalValue, FilteredVehicles)
    ).

% Filtrar por límite de presupuesto priorizando vehículos más baratos
filter_by_budget_limit(Type, BudgetLimit, TotalValue, FilteredVehicles) :-
    findall((Price, Brand, Reference), vehicle(Brand, Reference, Type, Price, _), AllVehicles),
    sort(AllVehicles, SortedVehicles),
    select_within_budget(SortedVehicles, BudgetLimit, 0, TotalValue, FilteredVehicles).

select_within_budget([], _, CurrentTotal, CurrentTotal, []).
select_within_budget([(Price, Brand, Reference)|Rest], BudgetLimit, CurrentTotal, FinalTotal, [(Brand, Reference, Price)|FilteredRest]) :-
    NewTotal is CurrentTotal + Price,
    NewTotal =< BudgetLimit,
    select_within_budget(Rest, BudgetLimit, NewTotal, FinalTotal, FilteredRest).
select_within_budget([(Price, _, _)|_], BudgetLimit, CurrentTotal, CurrentTotal, []) :-
    NewTotal is CurrentTotal + Price,
    NewTotal > BudgetLimit.

% CASOS DE PRUEBA

% Caso 1: Toyota SUV bajo $30,000
case1_toyota_suv_under_30k(Result) :-
    findall(Reference, 
            (vehicle(toyota, Reference, suv, Price, _), Price < 30000), 
            Result).

% Caso 2: Vehículos Ford agrupados por tipo y año
case2_ford_by_type_year(Result) :-
    bagof((Type, Year, Reference), 
          Price^vehicle(ford, Reference, Type, Price, Year), 
          Result).

% Caso 3: Valor total de sedanes sin exceder $500,000
case3_sedan_total_under_500k(TotalValue, FilteredVehicles) :-
    total_inventory_value(sedan, 500000, TotalValue, FilteredVehicles).

% FUNCIONALIDADES ADICIONALES

% Obtener el vehículo más caro de una marca
most_expensive_by_brand(Brand, Reference, Price) :-
    findall(P, vehicle(Brand, _, _, P, _), Prices),
    max_list(Prices, Price),
    vehicle(Brand, Reference, _, Price, _).

% Obtener vehículos por rango de años
vehicles_by_year_range(MinYear, MaxYear, Vehicles) :-
    findall((Brand, Reference, Type, Price, Year),
            (vehicle(Brand, Reference, Type, Price, Year),
             Year >= MinYear, Year =< MaxYear),
            Vehicles).

% Contar vehículos por tipo
count_by_type(Type, Count) :-
    findall(Reference, vehicle(_, Reference, Type, _, _), Vehicles),
    length(Vehicles, Count).