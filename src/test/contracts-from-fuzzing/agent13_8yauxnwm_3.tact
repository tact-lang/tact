contract TestControlFlow {
    // Test basic if statement
    fun testIf() : Int {
        if (2 + 2 == 4) {
            return 1;
        }
        return 0;
    }

    // Test if-else statement
    fun testIfElse() : Int {
        if (2 + 2 == 3) {
            return 2;
        } else {
            return 3;
        }
    }

    // Test nested if-else statement
    fun testNestedIfElse() : Int {
        if (2 + 2 == 3) {
            return 10;
        } else if (2 + 2 == 4) {
            return 20;
        } else {
            return 30;
        }
    }

    // Test try-catch mechanism
    fun testTryCatch() : Int {
        try {
            throw(101);
        } catch (e) {
            return e; // return the caught exit code
        }
    }

    // Test repeat loop: multiply accumulator by 2 for 5 iterations
    fun testRepeat() : Int {
        let twoPow: Int = 1;
        repeat (5) {
            twoPow *= 2;
        }
        return twoPow; // Expected 32
    }

    // Test while loop: decrement from 10 until 0
    fun testWhile() : Int {
        let x: Int = 10;
        while (x > 0) {
            x -= 1;
        }
        return x; // Expected 0
    }

    // Test do...until loop: decrement from 10 until <= 0
    fun testDoUntil() : Int {
        let y: Int = 10;
        do {
            y -= 1;
        } until (y <= 0);
        return y; // Expected 0
    }

    // Test foreach loop over a map; sum up values
    fun testForeach() : Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        let sum: Int = 0;
        foreach (key, value in m) {
            sum += value;
        }
        return sum; // Expected 300
    }
}
