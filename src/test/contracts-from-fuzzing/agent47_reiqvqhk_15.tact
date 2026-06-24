contract FuzzReturnTests {
    // f1: Simple return - last statement without a trailing semicolon.
    fun f1(): Int { return 42 }

    // f2: Nested if-else with multiple return paths.
    fun f2(x: Int): Int {
        if (x > 0) {
            if (x > 10) {
                return x - 10;
            } else {
                return x + 10;
            }
        } else {
            return -x;
        }
    }

    // f3: Return from inside a nested block.
    fun f3(): Int {
        {
            return 7;
        }
    }

    // f4: Early return inside a repeat loop.
    fun f4(n: Int): Int {
        repeat (n) {
            if (n == 5) {
                return 100;
            }
        }
        return 0;
    }

    // Field needed for getter
    v: Int = 20;

    // g: Getter function with conditional return.
    get fun g(): Int {
        if (self.v > 10) {
            return self.v;
        } else {
            return 0;
        }
    }
}
