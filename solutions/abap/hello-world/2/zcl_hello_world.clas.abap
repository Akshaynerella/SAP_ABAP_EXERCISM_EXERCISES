CLASS zcl_hello_world DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS hello RETURNING VALUE(res) TYPE string.
ENDCLASS.

CLASS zcl_hello_world IMPLEMENTATION.
  METHOD hello.
    res = 'Hello, World!'.
  ENDMETHOD.
ENDCLASS.
