primitive Int;

// This call fails with the default execution stack max level of 500.
const A: Int = multiplyByTwo(248);

fun multiplyByTwo(n: Int): Int {
    if (n < 0) {
        return -multiplyByTwo(-n);
    } else if (n == 0) {
        {
            {
                return 0;
            }
        }
    } else {
        return 2 + multiplyByTwo(n - 1);   // When it enters this branch, each call will open two levels in the environment stack.
    }                                      // Since the method is called 248 times, it creates around 496 levels in the stack.
}                                          // But the initial call adds another level; also, another level is added when the 
                                           // interpreter initializes before evaluating the expression in constant A.
                                           // So far, 498 levels would be required, but then, in the last call 
                                           // (when it enters the n = 0 case),
                                           // the if opens 3 more levels, reaching 501 levels, exceeding the limit.