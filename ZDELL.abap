*&---------------------------------------------------------------------*
*& Report ZDELL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdell.

CLASS ltc_main DEFINITION FINAL
      FOR TESTING
      DURATION SHORT
      RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    CONSTANTS iterations TYPE i VALUE 1000.
    TYPES: BEGIN OF ty_data,
             key   TYPE c LENGTH 30,
             text  TYPE c LENGTH 300,
             count TYPE i,
           END OF ty_data.

    DATA: mt_data TYPE STANDARD TABLE OF ty_data..

    METHODS setup.
    METHODS into ."FOR TESTING.
    METHODS reference_into FOR TESTING.
    METHODS assigning FOR TESTING.
ENDCLASS.
CLASS ltc_main IMPLEMENTATION.

  METHOD setup.
    DO 10000 TIMES.
      APPEND INITIAL LINE TO mt_data.
    ENDDO.
  ENDMETHOD.

  METHOD into.
    DO iterations TIMES.
      LOOP AT mt_data INTO DATA(ls_data).
        ls_data-key = 'A'.
        ls_data-count = ls_data-count + 1.
        ls_data-key = 'B'.
        ls_data-count = ls_data-count + 1.
        ls_data-key = 'C'.
        ls_data-count = ls_data-count + 1.
      ENDLOOP.
    ENDDO.
  ENDMETHOD.

  METHOD assigning.
    DO iterations TIMES.
      LOOP AT mt_data ASSIGNING FIELD-SYMBOL(<ls_data>).
        <ls_data>-key = 'A'.
        <ls_data>-count = <ls_data>-count + 1.
        <ls_data>-key = 'B'.
        <ls_data>-count = <ls_data>-count + 1.
        <ls_data>-key = 'C'.
        <ls_data>-count = <ls_data>-count + 1.
      ENDLOOP.
    ENDDO.
  ENDMETHOD.

  METHOD reference_into.
    DO iterations TIMES.
      LOOP AT mt_data REFERENCE INTO DATA(lr_data).
        lr_data->key = 'A'.
        lr_data->count = lr_data->count + 1.
        lr_data->key = 'B'.
        lr_data->count = lr_data->count + 1.
        lr_data->key = 'C'.
        lr_data->count = lr_data->count + 1.
      ENDLOOP.
    ENDDO.
  ENDMETHOD.
ENDCLASS.