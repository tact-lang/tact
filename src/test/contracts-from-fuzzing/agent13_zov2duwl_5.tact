struct Pair {
    first: Int;
    second: Int
}

contract ReturnTest {

    // 1. Regular function with early return
    fun early_return(x: Int): Int {
        if (x > 10) {
            return x + 1;
        } else {
            return x - 1;
        }
    }

    // 2. Return from a nested block
    fun nested_return(x: Int): Int {
        {
            let y: Int = x * 2;
            if (y > 20) {
                return y;
            }
        }
        return x;
    }

    // 3. Return inside a loop block
    fun loop_return(n: Int): Int {
        repeat (n) {
            if (n % 2 == 0) {
                return n / 2;
            }
        }
        return -1;
    }

    // 4. Function returning an optional Int
    fun optional_return(x: Int): Int? {
        if (x == 0) {
            return null;
        }
        return x;
    }

    // 5. Function returning a Pair (emulating tuple return)
    fun pair_return(x: Int): Pair {
        if (x % 2 == 0) {
            return Pair { first: x, second: x + 1 };
        } else {
            return Pair { first: x, second: x - 1 };
        }
    }

    // 6. Getter that modifies state (ephemeral modifications)
    v: Int = 0;

    get fun get_state(): Int {
        if (self.v < 5) {
            self.v = self.v + 1;
            return self.v;
        } else {
            return self.v;
        }
    }

    // 7. Receiver function with an explicit return
    receive() {
        return;
    }

    // 8. Function with multiple conditional return paths
    fun multi_path(x: Int): Int {
        if (x < 0) {
            return -100;
        } else if (x == 0) {
            return 0;
        } else {
            repeat (3) {
                if (x > 50) {
                    return 50;
                }
            }
            return x * 2;
        }
    }

    // 9. Function demonstrating implicit fallthrough by omitting semicolon in the last statement
    fun implicit_return(x: Int): Int {
        if (x == 1) {
            return 10
        }
        return 20;
    }
}
