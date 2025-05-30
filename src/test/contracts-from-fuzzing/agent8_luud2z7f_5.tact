struct Pair { first: Int; second: Int }

contract TestReturnValid {
    // Persistent state variable for getters
    v: Int = 10;

    // 1: Basic return function.
    fun basic_return(): Int {
        return 42;
    }

    // 2: Early return in if.
    fun early_return(x: Int): Int {
        if (x > 10) {
            return 100;
        } else {
            return x;
        }
    }

    // 3: Nested block return.
    fun nested_block_return(): Int {
        { return 77; }
    }

    // 4: Return from inside loop.
    fun return_in_loop(n: Int): Int {
        repeat(n) {
            if (n == 5) {
                return 555;
            }
        }
        return -1;
    }

    // 5: Multiple return paths with the same type.
    fun multiple_return_paths(a: Int): Int {
        if (a == 0) {
            return 0;
        } else if (a == 1) {
            return 1;
        }
        return 2;
    }

    // 6: Complex nested return within loop inside nested block.
    fun complex_nested(x: Int): Int {
        if (x > 0) {
            { repeat(2) { if (x == 42) { return 42; } } }
        }
        return 0;
    }

    // 7: Getter with conditional return.
    get fun getter_return(): Int {
        if (self.v > 0) {
            return self.v;
        } else {
            return -self.v;
        }
    }

    // 8: Getter with nested block return.
    get fun getter_nested(): Int {
        { if (self.v == 10) { return 1000; } }
        return 0;
    }

    // 9: Getter returning a tuple struct.
    get fun getter_tuple(): Pair {
        if (self.v > 5) {
            return Pair{ first: self.v, second: self.v * 2 };
        }
        return Pair{ first: 0, second: 0 };
    }

    // 10: Valid receiver with void return.
    receive () {
        if (self.v == 10) {
            return; 
        }
    }
}
