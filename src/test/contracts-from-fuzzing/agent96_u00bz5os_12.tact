contract Test {
    // A function using nested blocks and loops with explicit return statements
    fun nestedReturn(x: Int): Int {
        if (x > 0) {
            // Nested loop: early return if a condition is met
            repeat (3) {
                if (x == 5) {
                    return 99;
                }
            }
            // Nested block with explicit return
            {
                let a = x;
                return a + 1;
            }
        } else {
            return -1;
        }
    }

    // Getter using multiple return paths
    get fun getterMultiple(x: Int): Int {
        if (x > 10) {
            return 10; // early return
        } else if (x == 10) {
            // nested block returning value
            {
                return 20;
            }
        } else {
            return 30;
        }
    }

    // Regular function with return in a loop and final fallback
    fun loopReturn(x: Int): Int {
        repeat (5) {
            if (x == 2) {
                return 42;
            }
        }
        return x + 5;
    }
}
