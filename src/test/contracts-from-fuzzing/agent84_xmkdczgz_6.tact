contract TestBinaryOperators {
    fun add(a: Int, b: Int): Int {
        return a + b;
    }

    receive() {
        let a: Int = self.add(3, 4);         // 7
        let b: Int = 10 - 2 * 3;               // 10 - 6 = 4, tests precedence
        let c: Int = (10 - 2) * 3;             // 8 * 3 = 24, tests parentheses
        let d: Int = 20 / 4;                   // 5
        let e: Int = 7 % 3;                    // 1, modulo
        dump(a);
        dump(b);
        dump(c);
        dump(d);
        dump(e);
    }
}
