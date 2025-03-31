contract ReturnFuzzValid {
    // Regular function with all branches explicit returns
    fun explicitBranches(x: Int): Int {
        if (x > 10) {
            return x;
        } else {
            return 0;
        }
    }

    // Regular function with nested block that returns explicitly
    fun nestedReturn(x: Int): Int {
        if (x > 0) {
            { return x * 2; }
        } else {
            return -x;
        }
    }

    // Getter with explicit return statement
    get fun getExp(): Int {
        return 42;
    }

    // Receiver function using an explicit return statement (allowed in receivers)
    receive(msg: String) {
        return;
    }

    // Function with early return inside a loop
    fun loopEarlyReturn(n: Int): Int {
        repeat(n) {
            if (n == 3) {
                return 3;
            }
        }
        return n;
    }
}
