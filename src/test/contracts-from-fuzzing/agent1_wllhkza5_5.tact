contract Test {
    // Test 1: Early return from nested block
    fun nestedReturn(x: Int): Int {
        {
            if (x > 10) { return 100; }
        }
        return 0;
    }

    // Test 2: Early return inside a repeat loop within a nested block
    fun earlyReturnInLoop(x: Int): Int {
        {
            repeat (3) {
                if (x > 5) { return x + 1; }
            }
        }
        return x - 1;
    }

    // Test 3: Getter function with conditional early returns
    v: Int = 50;
    get fun conditionalGetter(): Int {
        if (self.v > 100) {
            return self.v;
        } else {
            return self.v + 10;
        }
    }

    // Test 4: Getter with nested block and repeat loop
    get fun complexGetter(): Int {
        let acc: Int = 0;
        {
            repeat (4) {
                acc = acc + 2;
                if (acc > 5) { return acc; }
            }
        }
        return acc;
    }
}
