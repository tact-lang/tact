primitive Int;

// This call fails with the default execution stack max level of 500.
const A: Int = multiplyByTwo(250);

fun multiplyByTwo(n: Int): Int {
    if (n < 0) {
        return -multiplyByTwo(-n);
    } else if (n == 0) {
        return 0;
    } else {
        return 2 + multiplyByTwo(n - 1);   // When it enters this branch, each call will open two levels in the environment stack.
    }                                      // Since the method is called 250 times, it creates around 500 levels in the stack.
}                                          // But the initial call adds another level, so it exceeds the limit during execution.