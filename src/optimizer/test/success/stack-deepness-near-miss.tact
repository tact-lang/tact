primitive Int;

// This call succeeds with the default execution stack max level of 500.
const A: Int = multiplyByTwo(249);

fun multiplyByTwo(n: Int): Int {
    if (n < 0) {
        return -multiplyByTwo(-n);
    } else if (n == 0) {
        return 0;
    } else {
        return 2 + multiplyByTwo(n - 1);   // When it enters this branch, each call will open two levels in the environment stack.
    }                                      // Since the method is called 249 times, it creates around 498 levels in the stack.
}                                          // But the initial call adds another level, plus the final level in the n = 0 case, 
                                           // gives around 500 levels, so it remains within the limit.