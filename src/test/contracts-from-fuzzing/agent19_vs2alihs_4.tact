struct MyTuple {
    a: Int;
    b: Int;
}

contract FinalReturnTest {
    // Initialize state variable v
    v: Int = 0;

    // Regular function with nested returns
    fun regularReturn(cond: Bool): Int {
        if (cond) {
            return 100;
        }
        {
            // Nested block with return
            if (!cond) {
                return 200;
            }
        }
        return 300; // Explicit fallthrough return
    }

    // Function with loop that returns from within the loop
    fun loopReturn(): Int {
        repeat (3) {
            // Even though the loop iterates, it always returns on the first iteration
            if (true) {
                return 400;
            }
        }
        return 0; // Fallback return (should never be reached)
    }

    // Function with explicit unit return
    fun testUnit() {
        return;
    }

    // Getter with multiple conditional return paths returning a tuple
    get fun getData(x: Int): MyTuple {
        if (x < 0) {
            return MyTuple{ a: -1, b: -2 };
        } else if (x == 0) {
            return MyTuple{ a: 0, b: 0 };
        } else {
            return MyTuple{ a: x, b: x + 10 };
        }
    }

    // Receiver with early return
    receive(str: String) {
        if (str == "exit") {
            return;
        }
        // Additional statements
        let dummy = 42;
    }
}
