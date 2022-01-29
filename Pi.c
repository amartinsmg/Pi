#include <stdio.h>

int main()
{
  double pi = 0;
  float k = 1;
  for (int i = 0; i < 1000000; i++)
  {
    if (i % 2 == 0)
    {
      pi += 4.0 / k;
    }
    else
    {
      pi -= 4.0 / k;
    }
    k += 2;
  }
  printf("Pi = %f \n", pi);
  return 0;
}