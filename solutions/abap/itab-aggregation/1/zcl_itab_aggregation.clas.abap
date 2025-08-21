CLASS zcl_itab_aggregation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_numbers_type,
             group  TYPE group,
             number TYPE i,
           END OF initial_numbers_type,
           initial_numbers TYPE STANDARD TABLE OF initial_numbers_type WITH EMPTY KEY.

    TYPES: BEGIN OF aggregated_data_type,
             group   TYPE group,
             count   TYPE i,
             sum     TYPE i,
             min     TYPE i,
             max     TYPE i,
             average TYPE f,
           END OF aggregated_data_type,
           aggregated_data TYPE STANDARD TABLE OF aggregated_data_type WITH EMPTY KEY.

    METHODS perform_aggregation
      IMPORTING
        initial_numbers        TYPE initial_numbers
      RETURNING
        VALUE(aggregated_data) TYPE aggregated_data.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_itab_aggregation IMPLEMENTATION.
  METHOD perform_aggregation.
      LOOP AT initial_numbers REFERENCE INTO DATA(wa_initial_numbers) 
              GROUP BY ( key = wa_initial_numbers->group 
              count  = GROUP SIZE )
              ASCENDING
              REFERENCE INTO DATA(groups).
      APPEND INITIAL LINE TO aggregated_data REFERENCE INTO DATA(aggregated_lineitem).
      aggregated_lineitem->group = groups->key.
      aggregated_lineitem->count = groups->count.
      aggregated_lineitem->min = 9999999999.
      aggregated_lineitem->max = 0.
      LOOP AT GROUP groups REFERENCE INTO DATA(groups_lineitem).
        aggregated_lineitem->sum = aggregated_lineitem->sum + groups_lineitem->number.
        aggregated_lineitem->min = nmin( val1 = aggregated_lineitem->min
                                         val2 = groups_lineitem->number ).
        aggregated_lineitem->max = nmax( val1 = aggregated_lineitem->max
                                         val2 = groups_lineitem->number ).
      ENDLOOP.
      aggregated_lineitem->average = aggregated_lineitem->sum / aggregated_lineitem->count.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
