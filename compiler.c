#include <stdio.h>

#include "common.h"
#include "compiler.h"
#include "scanner.h"

void compile(const char* source) {
    initScanner(source);
    int line = -1;
    for (;;) { // infinite loop like while(true)
        Token token = scanToken();
        if (token.line != line) {
            printf("%4d ", token.line);
            line = token.line;
        } else {
            printf(" | ");
        }
        // %.*s lets you pass the precision as an argument
        printf("%2d '%s.*s'\n", token.type, token.length, token.start);
        if (token.type == TOKEN_EOF) break;
    }
}
