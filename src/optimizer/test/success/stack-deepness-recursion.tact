primitive Int;

// This call succeeds with the default execution stack max level of 500.
const A: Int = multiplyByTwo(200);

fun multiplyByTwo(n: Int): Int {
    if (n < 0) {
        return -multiplyByTwo(-n);
    } else if (n == 0) {
        return 0;
    } else {
        return 2 + multiplyByTwo(n - 1);   // When it enters this branch, each call will open two levels in the environment stack.
    }                                      // Since the method is called 200 times, it creates around 400 levels in the stack,
}                                          // plus the initial call, plus the final level for the n = 0 case, remains within the limit.