contract ModuloTest() {
    fun test() {
        // Test modulo operation with negative divisor
        // Expected: 1 % -5 should yield -4 as per docs
        let result = 1 % -5;
        dump(result); // Expected output: -4
    }

    receive() {
         self.test();
    }
}
