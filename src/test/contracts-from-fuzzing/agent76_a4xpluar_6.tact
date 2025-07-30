contract ReturnTester {
    v: Int;

    // Initialize contract field v in the init() function
    init() {
        self.v = 5;
    }

    // Valid receive function: cannot return a value
    receive() {}

    // 1. Regular function with conditional returns
    fun regularReturn(x: Int): Int {
        if (x > 0) {
            return x + 10;
        } else {
            return x - 10;
        }
    }

    // 2. Function with nested block returns and a repeat loop
    fun nestedBlockReturn(x: Int): Int {
        if (x < 5) {
            { return 100; }
        }
        repeat (3) {
            // 'repeat' loop does not provide an index
            // simulate a condition using x
            if (x == 7) {
                return 7;
            }
        }
        return -1;
    }

    // 3. Function returning an optional Int
    fun returnOptional(flag: Bool): Int? {
        if (flag) {
            return 42;
        } else {
            return null;
        }
    }

    // 4. Getter with nested blocks and conditional returns (using self.v)
    get fun complexGetter(): Int {
        if (self.v == 0) {
            { return 999; }
        } else if (self.v > 10) {
            return self.v;
        } else {
            return -self.v;
        }
    }
}
