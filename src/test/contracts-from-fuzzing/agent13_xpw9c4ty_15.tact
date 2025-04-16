contract BitwiseTest() {
    fun test() {
        let five = 5;
        // According to documentation:
        // ~five should be -6
        dump(~five);            // Expected output: -6
        // -(~five) should be 6
        dump(-(~five));         // Expected output: 6
        // ~(-five) should be 4
        dump(~(-five));         // Expected output: 4
    }

    receive() {
        self.test();
    }
}
