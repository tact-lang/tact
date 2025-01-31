primitive Int;

const A: Int = multiplyByTwo(200);

fun multiplyByTwo(n: Int): Int {
    if (n < 0) {
        return -multiplyByTwo(-n);
    } else if (n == 0) {
        return 0;
    } else {
        return 2 + multiplyByTwo(n - 1);   
    }                                      
}                                          