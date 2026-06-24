contract TestIntArithmetic {
    fun test() {
        // Simple integer arithmetic tests
        let a: Int = 2 + 3;       // should be 5
        let b: Int = 10 - 3;      // should be 7
        let c: Int = a * b;       // 5 * 7 = 35
        let d: Int = 3 / 2;       // division rounding toward -∞, expected 1
        dump(a);
        dump(b);
        dump(c);
        dump(d);
    }

    receive() {
        self.test();
    }
}
