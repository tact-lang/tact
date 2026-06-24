struct S { a: Int; b: Int; }

struct Pair { first: Int; second: Int; }

contract FuzzComprehensive {
    // Basic arithmetic test with augmented assignment
    fun arithmeticTest(x: Int): Int {
        let y: Int = x;
        y += 5;
        return y;
    }

    // Ternary operator test with nested conditions
    fun ternaryTest(x: Int): Int {
        return (x > 10) ? (x * 2) : ((x < 5) ? (x + 3) : (x - 3));
    }

    // Destructuring assignment test on struct S
    fun destructuringTest(): Int {
        let s: S = S { a: 10, b: 20 };
        let S { a, b } = s;
        return a + b;
    }

    // Map iteration test using foreach loop to sum values
    fun mapIterationTest(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        let sum: Int = 0;
        foreach (k, v in m) {
            sum = sum + v;
        }
        return sum;
    }

    // Nested loop test: repeat loop containing a foreach loop
    fun nestedLoopTest(n: Int): Int {
        let total: Int = 0;
        repeat (n) {
            let m: map<Int, Int> = emptyMap();
            m.set(1, 10);
            m.set(2, 20);
            foreach (_, val in m) {
                total = total + val;
            }
        }
        return total;
    }

    // Function with nested if-else and block-based return
    fun nestedIfReturn(a: Int, b: Int): Int {
        if (a > b) {
            { let diff: Int = a - b; return diff; }
        } else if (a < b) {
            return b - a;
        } else {
            return 0;
        }
    }

    // Function with early return inside a repeat loop
    fun repeatReturn(n: Int): Int {
        repeat (n) {
            if ((n % 2) == 0) {
                return n / 2;
            }
        }
        return -999;
    }

    // Function with foreach loop over a map and nested block return
    fun foreachReturn(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        m.set(3, 30);
        foreach (key, value in m) {
            if (value == 20) {
                { return value + 7; }
            }
        }
        return -1;
    }

    // Function returning an optional value
    fun optionalReturn(flag: Bool): Int? {
        if (flag) {
            { return 777; }
        }
        return null;
    }

    // Function with deeply nested block returns
    fun deepNestedReturn(x: Int): Int {
        { { if (x > 100) { return x - 100; } else { { if (x > 50) { return x - 50; } } } } }
        return 0;
    }

    // Getter returning a Pair struct using nested conditionals
    get fun getPairFuzz(): Pair {
        if (self.nestedIfReturn(15, 10) > 0) {
            return Pair { first: self.repeatReturn(8), second: self.foreachReturn() };
        }
        return Pair { first: 111, second: 222 };
    }

    // Getter returning a Pair struct computed from ternaryTest
    get fun computedPair(): Pair {
        let v: Int = self.ternaryTest(12);
        if (v > 20) {
            return Pair { first: v, second: v - 10 };
        }
        return Pair { first: 0, second: 0 };
    }

    // Receiver function with side effects
    receive () {
        dump(self.arithmeticTest(3));
        dump(self.ternaryTest(7));
        dump(self.destructuringTest());
        dump(self.mapIterationTest());
        dump(self.nestedLoopTest(3));
        dump(self.nestedIfReturn(20, 10));
        dump(self.repeatReturn(6));
        dump(self.foreachReturn());
        dump(self.optionalReturn(true));
        dump(self.deepNestedReturn(120));
        return;
    }
}
