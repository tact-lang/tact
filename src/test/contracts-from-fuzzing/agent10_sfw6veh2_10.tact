contract FuzzReturn2 {
    // Deeply nested return inside multiple blocks
    fun deepNestedReturn(x: Int): Int {
        if (x < 0) {
            { if (x == -1) { return 10; } }
            return 20;
        } else {
            { { return 30; } }
        }
    }

    // Return statement inside a loop with nested block
    fun loopNestedReturn(n: Int): Int {
        let i: Int = 0;
        while (i < n) {
            { if (i == 2) { return i * 10; } }
            i = i + 1;
        }
        return 0;
    }

    // Complex nested conditionals with multiple return paths
    fun complexConditional(flag: Bool, x: Int): Int {
        if (flag) {
            if (x > 100) {
                return 100;
            } else {
                { return x; }
            }
        } else {
            if (x < 50) {
                return 50;
            } else {
                return x + 1;
            }
        }
    }

    // Long chain of if-else with deeply nested return
    fun longChainReturn(x: Int): Int {
        if (x == 0) {
            return 0;
        } else if (x == 1) {
            return 1;
        } else if (x == 2) {
            return 2;
        } else {
            {{{ return x * 2; }}}
        }
    }

    // Function returning an optional Int with various return paths
    fun multiOptReturn(x: Int): Int? {
        if (x < 0) {
            return null;
        } else if (x == 0) {
            return 0;
        } else {
            { return x + 100; }
        }
    }

    // Function with unreachable code after return (unreachable code removed)
    fun unreachableAfterReturn(x: Int): Int {
        return x;
    }

    // Unit-returning function with multiple nested returns
    fun unitMultipleReturn(flag: Bool) {
        if (flag) { { return; } } else { return; }
    }

    // Getter that returns a state value from a nested block
    v: Int = 5;
    get fun getState(): Int {
        { return self.v; }
    }

    // A receiver that uses Slice as its parameter (valid type for receiver)
    receive (msg: Slice) {
        { return; }
    }
}
