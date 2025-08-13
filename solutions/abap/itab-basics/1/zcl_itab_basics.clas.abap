CLASS zcl_itab_basics DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_type,
             group       TYPE group,
             number      TYPE i,
             description TYPE string,
           END OF initial_type,
           itab_data_type TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.

    METHODS fill_itab
           RETURNING
             VALUE(initial_data) TYPE itab_data_type.

    METHODS add_to_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS sort_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS search_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
             VALUE(result_index) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_itab_basics IMPLEMENTATION.
  METHOD fill_itab.
    "add solution here
    DATA wa LIKE LINE OF initial_data.
    wa-group = 'A'.
    wa-number = 10.
    wa-description = 'Group A-2'.
    APPEND wa TO initial_data.
    CLEAR wa.

    wa-group = 'B'.
    wa-number = 5.
    wa-description = 'Group B'.
    APPEND wa TO initial_data.
    CLEAR wa.

    wa-group = 'A'.
    wa-number = 6.
    wa-description = 'Group A-1'.
    APPEND wa TO initial_data.
    CLEAR wa.

    wa-group = 'C'.
    wa-number = 22.
    wa-description = 'Group C-1'.
    APPEND wa TO initial_data.
    CLEAR wa.

    wa-group = 'A'.
    wa-number = 13.
    wa-description = 'Group A-3'.
    APPEND wa TO initial_data.
    CLEAR wa.

    wa-group = 'C'.
    wa-number = 500.
    wa-description = 'Group C-2'.
    APPEND wa TO initial_data.
    CLEAR wa.
    
  ENDMETHOD.

  METHOD add_to_itab.
    updated_data = initial_data.
    DATA wa LIKE LINE OF updated_data.
    "add solution here
    wa-group = 'A'.
    wa-number = 19.
    wa-description = 'Group A-4'.
    append wa TO updated_data.
  ENDMETHOD.

  METHOD sort_itab.
    updated_data = initial_data.
    "add solution here
    SORT updated_data BY group ASCENDING number DESCENDING.
  ENDMETHOD.

  METHOD search_itab.
    DATA(temp_data) = initial_data.
    DATA wa LIKE LINE OF temp_data.
    "add solution here
    LOOP AT temp_data INTO wa.
      IF wa-number = 6.
         result_index = sy-tabix.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
