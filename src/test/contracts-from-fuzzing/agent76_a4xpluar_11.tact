contract ReturnFuzz {
    v: Int;

    init() {
        self.v = 10;
    }

    receive() { }

    // 1. Regular function with conditional return
    fun testRegular(x: Int): Int {
        if (x > 0) {
            return x + 1;
        } else {
            return x - 1;
        }
    }

    // 2. Function with nested block return
    fun testBlock(x: Int): Int {
        { return x * 2; }
    }

    // 3. Function with return inside a repeat loop
    fun testRepeat(n: Int): Int {
        repeat(n) {
            if (n == 3) {
                return 3;
            }
        }
        return 0;
    }

    // 4. Function returning an optional Int
    fun testOptional(flag: Bool): Int? {
        if (flag) {
            return 42;
        } else {
            return null;
        }
    }

    // 5. Getter using nested block return
    get fun testGetter(): Int {
        if (self.v < 5) {
            { return 100; }
        } else {
            return self.v;
        }
    }
}
