contract TestConst() {
    // Define a constant using the compile-time built-in function ascii
    // ascii("ABC") will produce an integer based on the ASCII encoding of "ABC"
    const CONST_A: Int = ascii("ABC");

    // Test function to dump the constant value
    fun test() {
        dump(self.CONST_A);
    }

    receive() {
        self.test();
        cashback(sender());
    }
}
