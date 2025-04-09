contract ExprSelfAndNull {
    const MOON_RADIUS_KM: Int = 1738;

    fun test() {
        // Using 'self' to access contract-level constant
        dump(self.MOON_RADIUS_KM); // expected output: 1738
        
        // Testing null literal in an optional variable
        let n: Int? = null;
        dump(n); // expected: null (or similar absence value)
    }

    receive() {
        self.test();
    }
}
