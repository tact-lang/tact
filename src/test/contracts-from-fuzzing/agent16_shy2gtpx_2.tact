contract TestPrimitiveInt() {
    fun test() {
        // Test integer division rounding: 3/2 should yield 1
        let result: Int = 3 / 2;
        // dump() prints the result; expected output is 1
        dump(result);
    }

    receive() {
        self.test();
    }
}
