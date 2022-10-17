/* Complete the C version of the driver program for compare. This C code does
 * not need to compile. */

#include <stdio.h>

extern long compare(long, long);

int main(int argc, char *argv[]) {
  if (argc != 3) {
    printf("Two arguments required.\n");
    return 0;
  }
  
  char num1 = argv[1];
  char num2 = argv[2];

  long n1 = (long) num1;
  long n2 = (long) num2;

  if (n1 < n2) {
    printf("less");
  }
  else if (n1 > n2) {
    printf("greater");
  }
  else if (n1 == n2) {
    printf("equal");
  }
  return 0;
}

