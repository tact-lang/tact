struct Pair {
    a: Int;
    b: Int;
}

contract ExhaustiveTest {
    // Simple addition function
    fun add(x: Int, y: Int): Int {
        return x + y
    }

    // Helper function: doubles the input
    fun double(x: Int): Int {
        return x * 2
    }

    // Destructuring assignment test using a Pair struct
    fun destructureTest(p: Pair): Int {
        let Pair { a, b } = p;
        return a * 10 + b
    }

    // Nested ternary operator test; explicit parentheses for clarity
    fun nestedTernary(x: Int): Int {
        // if x > 10 then (if x > 20 then 100 else 50) else (if x > 5 then 20 else 5)
        return x > 10 ? (x > 20 ? 100 : 50) : (x > 5 ? 20 : 5)
    }

    // Loop test with early return inside loop
    fun loopReturn(x: Int): Int {
        let current: Int = x;
        repeat (5) {
            if (current % 2 == 0) {
                return current
            }
            current = current + 3
        }
        return current
    }

    // Complex expression combining arithmetic and ternary operator
    fun complexExpression(x: Int, y: Int): Int {
        return (x * 2 + y > 50) ? (x - y) : (x + y)
    }

    // Persistent state variable, initialized
    v: Int = 10;

    // Getter that aggregates results from various tests
    get fun getAggregate(): Int {
        let p: Pair = Pair { a: 3, b: 7 };
        let d: Int = self.destructureTest(p);    // Expected 3*10+7 = 37
        let t: Int = self.nestedTernary(self.v);   // With v = 10, (10 > 10 false, but 10 > 5 true) gives 20
        let l: Int = self.loopReturn(self.v);      // v = 10, 10 is even, returns 10
        let c: Int = self.complexExpression(self.v, d); // 10*2+37 = 57 > 50, so returns (10 - 37) = -27
        return d + t + l + c  // 37 + 20 + 10 - 27 = 40
    }

    // Receiver function: if message is non-empty, add 5 to state
    receive(msg: String) {
        if (msg != "") {
            self.v = self.v + 5
        }
    }
}
