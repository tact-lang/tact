struct Pair {
    first: Int;
    second: Int;
}

contract ValidReturn {
    // 1. Regular function with early return
    fun earlyReturn(x: Int): Int {
        if (x > 0) {
            return x;
        } else {
            return -x;
        }
    }

    // 2. Nested block with return inside
    fun nestedReturn(x: Int): Int {
        {
            if (x == 0) {
                return 42;
            }
        }
        return x;
    }

    // 3. Function with explicit fallthrough return
    fun fallthroughReturn(x: Int): Int {
        if (x < 0) {
            return -x;
        } else {
            return x + 10;
        }
    }

    // 4. Loop with a return inside
    fun loopReturn(x: Int): Int {
        let i: Int = 0;
        while (i < x) {
            if (i == 2) {
                return i;
            }
            i = i + 1;
        }
        return i;
    }

    // 5. Function with multiple return paths
    fun multiReturn(flag: Bool): Int {
        if (flag) {
            return 1;
        } else {
            return 2;
        }
    }

    // 6. Function returning unit
    fun unitFn(flag: Bool) {
        if (flag) {
            return;
        }
        // Implicit fallthrough allowed for unit functions
    }

    // 7. Getter returning a primitive
    get fun getPrimitive(): Int {
        return 100;
    }

    // 8. Getter returning an optional struct
    get fun getPair(flag: Bool): Pair? {
        if (flag) {
            return Pair { first: 1, second: 2 };
        } else {
            return null;
        }
    }

    // 9. Getter with explicit branches for implicit return
    get fun getImplicit(): Int {
        if (false) {
            return 123;
        } else {
            return 999;
        }
    }

    // 10. Receiver function (return is allowed but ignored)
    receive() {
        return;
    }
}
