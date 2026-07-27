#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main() {
    char num[5]; // Maximum 4 digits + null character
    int decimal = 0;

    scanf("%s", num);

    for (int i = 0; i < strlen(num); i++) {
        char ch = toupper(num[i]);
        int value;

        if (ch >= '0' && ch <= '9')
            value = ch - '0';
        else
            value = ch - 'A' + 10;

        decimal = decimal * 17 + value;
    }

    printf("%d\n", decimal);

    return 0;
}