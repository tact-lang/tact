contract TestIntegers {
    fun test() {
        let a: Int = 1 + 1; // expect 2
        let b: Int = 3 / 2; // expect 1, rounding down toward -∞
        dump(a);
        dump(b);
    }

    receive() { self.test(); }
}
