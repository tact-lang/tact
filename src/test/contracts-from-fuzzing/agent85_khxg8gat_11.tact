struct Pair { a: Int; b: Int }

contract ReturnEdgeCasesFuzz {
    // Function testing conditional returns with all branches covered
    fun testConditional(x: Int): Int {
        if (x == 0) {
            return 0;
        } else if (x > 0) {
            return x;
        } else {
            return -x;
        }
    }

    // Function testing early return inside a loop block
    fun testLoopReturn(): Int {
        let result: Int = 0;
        repeat (3) {
            if (result == 0) {
                return 99;
            }
            result = result + 1;
        }
        return result;
    }

    // Getter that returns a struct, testing conditional return paths
    get fun getPair(): Pair {
        if (now() % 2 == 0) {
            return Pair{ a: 10, b: 20 };
        }
        return Pair{ a: 30, b: 40 };
    }

    // Receiver function using an early return
    receive() {
        if (true) { return; }
    }
}
