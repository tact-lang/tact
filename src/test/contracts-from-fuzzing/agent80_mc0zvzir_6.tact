struct Pair { first: Int; second: Int }

contract TestContract {
    a: Int;
    b: Int;

    init(x: Int, y: Int) {
        self.a = x;
        self.b = y;
    }

    // Getter that returns a struct, with two return paths
    get fun getPair(): Pair {
        if (self.a > self.b) {
            return Pair{ first: self.a, second: self.b };
        } else {
            return Pair{ first: self.b, second: self.a };
        }
    }

    // Receiver that explicitly uses return
    receive() {
        // In receivers, return is allowed but returns no value
        return;
    }

    // Function with return inside a loop and nested blocks
    fun testLoopReturn(x: Int): Int {
        repeat (x) {
            if (x == 3) {
                return 3;
            }
        }
        return 0;
    }

    // Function with implicit fallthrough vs explicit return
    fun conditionalReturn(cond: Bool): Int {
        if (cond) {
            return 42;
        } else {
            // no explicit return here, but fallthrough to final return
        }
        return -1;
    }
}
