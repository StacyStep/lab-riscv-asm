#include <stdio.h>

#define N 4
#define M 4

void process(int n, int m, int matrix[N][M], int column, int sum)
{
    sum = 0;
    for (int i = 0; i < n; ++i) {
            sum += matrix[i][column];
    }

}

int main(int argc, char** argv)
{
    int matrix[N][M];
    int column, sum = 0;

    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    process(N, M, matrix, column, sum);

    printf("Sum: %d\n", sum);

    return 0;
}