contract ValidReturns {
    // Regular function with early return
    fun earlyReturn(x: Int): Int {
        if (x > 0) {
            return x;
        }
        return -x;
    }

    // Function with a return inside a loop block
    fun loopReturn(x: Int): Int {
        repeat (5) {
            if (x == 0) {
                return 100;
            }
        }
        return x;
    }

    // Function with a nested block return
    fun nestedReturn(x: Int): Int {
        {
            let y = x * 2;
            if (y > 10) {
                return y;
            }
        }
        return x;
    }

    // Function returning an optional value
    fun optionalReturn(x: Int): Int? {
        if (x > 10) {
            return x;
        } else {
            return null;
        }
    }

    // Getter with explicit return
    get fun getVal(): Int {
        return 42;
    }

    // Standard receive function (no return value allowed)
    receive() {}
}
