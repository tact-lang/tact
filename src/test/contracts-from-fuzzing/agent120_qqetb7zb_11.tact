struct Data {
    x: Int;
    y: String;
}

struct Pair {
    a: Int;
    b: Int;
}

contract TestReturnBehavior {
    // Regular function with early return and a nested block
    fun testEarly(x: Int): Int {
        if (x < 0) {
            return -1;
        }
        {
            let y = x * 2;
            if (y > 10) {
                return y;
            }
        }
        return x;
    }

    // Function with a repeat loop that returns from within the loop
    fun testLoopReturn(): Int {
        let res: Int = 0;
        repeat (3) {
            res = res + 1;
            if (res == 2) {
                return res;
            }
        }
        return res;
    }

    // Function with conditional branches (all branches explicitly return a value)
    fun testConditional(x: Int): Int {
        if (x == 0) {
            return 100;
        } else {
            return x + 10;
        }
    }

    // Function that returns a tuple-like value as a struct
    fun testTupleReturn(): Pair {
        return Pair { a: 1, b: 2 };
    }

    // Function returning an optional value
    fun testOptional(x: Int): Int? {
        if (x == 0) {
            return null;
        } else {
            return x;
        }
    }

    // Getter that returns a complex struct
    get fun testGetter(): Data {
        return Data { x: 42, y: "getter" };
    }

    // Receiver function: allowed to use an explicit 'return' without a value
    receive(msg: Slice) {
        dump(msg);
        return;
    }
}
