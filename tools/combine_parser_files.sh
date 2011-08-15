#!/bin/sh
# 
# Combines the 'header' code and 'footer' code with the parser
# code generated by greg from the grammar description into
# one file.
# 

HEADER_ROW=$(grep -nF '/// header_code_here' pmh_parser_core.c | awk 'BEGIN{FS=":"};{print $1}')
HEADER_ROW_BEFORE=$(expr $HEADER_ROW - 1)
HEADER_ROW_AFTER=$(expr $HEADER_ROW + 1)

head -n ${HEADER_ROW_BEFORE} pmh_parser_core.c
cat pmh_parser_head.c
tail -n +${HEADER_ROW_AFTER} pmh_parser_core.c
cat pmh_parser_foot.c


