contract TestA {
    receive() {}

    // Test: Return inside a repeat loop in a regular function
    fun testLoopReturn(): Int {
        repeat (3) {
            if (true) {
                return 42;
            }
        }
        return 0;
    }

    // Test: Function with optional return
    fun testOptionalReturn(x: Int): Int? {
        if (x > 0) {
            return x;
        } else {
            return null;
        }
    }
}

contract GetterTest {
    v: Int = 0;
    
    receive() {}

    // Getter with conditional return paths using self.v
    get fun getValue(): Int {
        if (self.v > 10) {
            return self.v + 1;
        }
        return self.v - 1;
    }
}

contract ReceiverTest {
    // Receiver with explicit return
    receive() {
        return;
    }
}

contract ReceiverLoopTest {
    // Receiver with a repeat loop and an early return
    receive() {
        repeat (3) {
            if (true) {
                return;
            }
        }
    }
}
