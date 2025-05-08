struct MyPair {
    a: Int;
    b: Int;
}

contract TestReturn {
    v: Int = 10;

    // Regular function with if-else early return
    fun reg_if(flag: Bool): Int {
        if (flag) {
            return 100;
        }
        return 200;
    }

    // Regular function with nested block returns
    fun reg_nested(x: Int): Int {
        {
            if (x > 5) {
                return x * 2;
            }
            return x - 1;
        }
    }

    // Function using repeat loop with early return from within the loop
    fun reg_repeat(target: Int): Int {
        repeat (5) {
            // If target equals 3, return early
            if (target == 3) {
                return 999;
            }
        }
        return 0;
    }

    // Getter returning a struct (simulating tuple return)
    get fun getterPair(): MyPair {
        if (self.v > 0) {
            return MyPair { a: self.v, b: self.v + 10 };
        }
        return MyPair { a: -1, b: -10 };
    }

    // Receiver function with a return statement
    receive () {
        let flag: Bool = true;
        if (flag) {
            return;
        }
        // Unreachable code:
        let x = 5;
    }
}
