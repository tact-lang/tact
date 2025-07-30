contract TestControlFlowSummary {
    // Compiled tests for control flow constructs in Tact

    // if, if-else, nested if-else are working as per docs
    fun testIfResult() : Int {
        if (2 + 2 == 4) {
            return 1;
        }
        return 0;
    }

    fun testIfElseResult() : Int {
        if (2 + 2 == 3) {
            return 2;
        } else {
            return 3;
        }
    }

    fun testNestedIfElseResult() : Int {
        if (2 + 2 == 3) {
            return 10;
        } else if (2 + 2 == 4) {
            return 20;
        } else {
            return 30;
        }
    }

    // try-catch functions compile and behave as documented (see docs [1, 5, 6])
    fun testTryCatchResult() : Int {
        try {
            throw(101);
        } catch (e) {
            return e;
        }
    }

    // Loop constructs
    fun testRepeatResult() : Int {
        let r: Int = 1;
        repeat (5) {
            // multiply by 2 each iteration
            r *= 2;
        }
        return r; // Expected 32
    }

    fun testWhileResult() : Int {
        let x: Int = 10;
        while (x > 0) {
            x -= 1;
        }
        return x; // Expected 0
    }

    fun testDoUntilResult() : Int {
        let y: Int = 10;
        do {
            y -= 1;
        } until (y <= 0);
        return y; // Expected 0
    }

    fun testForeachResult() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        let sum: Int = 0;
        foreach (key, value in m) {
            sum += value;
        }
        return sum; // Expected 300
    }

    // Additional control flow tests: loop edge cases
    fun testRepeatEdge() : Int {
        let a: Int = 1;
        // zero repeat does nothing
        repeat (0) {
            a *= 2;
        }
        return a; // Expected 1
    }

    fun testDoUntilMinOnce() : Int {
        let c: Int = 0;
        do {
            c += 1;
        } until (true);
        return c; // Expected 1
    }
}
