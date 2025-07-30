struct Pair {
    a: Int;
    b: Int
}

contract ReturnFuzzCycle {

    // Persistent state variable for getter test
    v: Int = 0;

    // 1. Regular function with if-else return
    fun regReturn(x: Int): Int {
        if (x > 100) {
            return x - 10;
        } else {
            return x + 10;
        }
    }

    // 2. Return from a nested block
    fun nestedReturn(x: Int): Int {
        {
            let y: Int = x * 3;
            if (y > 50) {
                return y;
            }
        }
        return x;
    }

    // 3. Return inside a loop block
    fun loopReturn(n: Int): Int {
        repeat (n) {
            if (n % 3 == 0) {
                return n / 3;
            }
        }
        return -999;
    }

    // 4. Function returning an optional Int
    fun optReturn(x: Int): Int? {
        if (x < 0) {
            return null;
        }
        return x * 2;
    }

    // 5. Getter that ephemerally modifies state
    get fun stateGetter(): Int {
        if (self.v < 3) {
            self.v = self.v + 1;
            return self.v;
        } else {
            return self.v;
        }
    }

    // 6. Function demonstrating implicit return (omitting semicolon on last statement)
    fun implicitReturn(x: Int): Int {
        if (x == 0) { return 0; }
        return 100;
    }

    // 7. Function with multiple conditional return paths and a nested repeat
    fun multiPath(x: Int): Int {
        if (x < 0) { return -1; } else if (x == 0) { return 0; } else {
            repeat (2) {
                if (x > 50) { return 50; }
            }
            return x * 2;
        }
    }

    // 8. Function returning a Pair struct (emulating tuple return)
    fun pairReturn(x: Int): Pair {
        if (x % 2 == 0) {
            return Pair { a: x, b: x + 5 };
        } else {
            return Pair { a: x, b: x - 5 };
        }
    }

    // 9. Function demonstrating fallthrough return
    fun fallthroughReturn(x: Int): Int {
        if (x > 10) { return 1; }
        return 2;
    }

    // 10. Function with nested loops and a return inside
    fun nestedLoopReturn(x: Int): Int {
        repeat (3) {
            let temp: Int = x + 1;
            if (temp > 10) { return temp; }
        }
        return x;
    }

    // 11. Receiver function with an explicit return
    receive() {
        return;
    }
}
