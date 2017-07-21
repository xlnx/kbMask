#include <stdio.h>

#define KB_COUNT    (100)

int main()
{
	FILE* fp = fopen("C:/Users/xlnx/Desktop/kbMask/kbMask.rc", "w");
	
    for (int i = 0; i != KB_COUNT; ++i)
    {
    	fprintf(fp, "a%d BITMAP \"C:/Users/xlnx/Desktop/kbMask/bitmap/%d.bmp\"\n", i, i);
    }
    fclose(fp);
}
