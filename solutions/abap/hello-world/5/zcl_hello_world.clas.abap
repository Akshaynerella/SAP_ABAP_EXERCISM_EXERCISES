CLASS zcl_hello_world DeFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS hello RETURNING VALUE(str) TYPE string.
ENDCLASS.

CLASS zcl_hello_world IMPLEMENTATION.
  METHOD hello.
    str = 'Hello, World!'.
  ENDMETHOD.
ENDCLASS.
