contract Test1 {
    fun testReturn1(): Int {
        return 42;
    }
}

contract Test2 {
    fun testTryCatch(x: Int): Int {
        let result: Int = 0;
        try {
            result = 10 / x;
            return result;
        } catch (err) {
            return -1;
        }
    }
}

contract Test3 {
    fun testNested(x: Int): Int {
        try {
            try {
                if (x == 0) { throw(1); }
                return 100 / x;
            } catch (err) {
                return -10;
            }
        } catch (err) {
            return -100;
        }
    }
}

contract Test4 {
    v: Int;

    init() {
        self.v = 0;
    }

    fun doReceive(inp: Int) {
        if (inp > 0) { return; }
        self.v = inp;
    }

    get fun getValue(): Int {
        try {
            self.doReceive(42);
            return self.v;
        } catch (err) {
            return -1;
        }
    }
}

contract Test5 {
    fun complexControl(x: Int): Int {
        if (x < 0) {
            try {
                if (x == -1) { throw(5); } else { return x; }
            } catch (err) {
                return 100;
            }
        } else {
            try {
                let res: Int = x;
                if (res == 0) { return 0; }
                return res;
            } catch (err) {
                return -5;
            }
        }
    }
}
