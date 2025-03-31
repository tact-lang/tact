struct Pair { first: Int; second: Int; }

contract ReturnValid {

    // Regular function with early return
    fun earlyReturn(x: Int): Int {
        if (x > 0) {
            return x;
        }
        return -x;
    }

    // Function returning from inside a repeat loop
    fun loopReturn(n: Int): Int {
        repeat (n) {
            if (n == 3) {
                return 42;
            }
        }
        return 0;
    }

    // Function returning from nested blocks
    fun nestedReturn(x: Int, y: Int): Int {
        {
            {
                if (x > y) {
                    return x;
                }
            }
        }
        return y;
    }

    // Function returning a tuple-like value using a struct literal
    fun tupleReturn(a: Int, b: Int): Pair {
        if (a > b) {
            return Pair { first: a, second: b };
        }
        return Pair { first: b, second: a };
    }

    // State variable used by getter
    v: Int = 5;

    // Getter with conditional return
    get fun compute(): Int {
        if (self.v > 10) {
            return self.v;
        } else {
            return self.v + 100;
        }
    }

    // Receiver function returning unit
    receive() {
        return;
    }

    // Function returning an optional value
    fun optionalReturn(x: Int): Int? {
        if (x > 0) {
            return x;
        }
        return null;
    }

    // Another function with conditional return
    fun getterReturn(): Int {
        if (self.v % 2 == 0) {
            return 100;
        }
        return self.v;
    }
}
