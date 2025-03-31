struct Pair { first: Int; second: Int; }

contract ReturnTests {
    // Persistent state variable: provide an initial value
    v: Int = 0;

    // 1. Regular function with conditional returns
    fun reg(x: Int): Int {
        if (x % 2 == 0) {
            return x;
        } else {
            return -x;
        }
    }

    // 2. Nested block return function
    fun nested(x: Int): Int {
        {
            if (x == 0) {
                return 42;
            }
        }
        return x;
    }

    // 3. Loop with early return
    fun loopTest(n: Int): Int {
        let sum: Int = 0;
        repeat (n) {
            if (n == 3) {
                return n;
            }
        }
        return sum;
    }

    // 4. Function returning an optional Int
    fun optTest(x: Int): Int? {
        if (x > 10) {
            return x;
        }
        return null;
    }

    // 5. Getter with complex return value using struct Pair
    get fun getterTest(): Pair {
        if (self.v > 100) {
            return Pair { first: self.v, second: self.v - 10 };
        }
        return Pair { first: self.v, second: self.v + 10 };
    }

    // 6. Receiver with early return
    receive() {
        if (true) {
            return;
        }
        dump(123);
    }
}
