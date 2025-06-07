contract TestConstants() {
    // Compile-time evaluation of built-in functions
    const TON_ONE: Int = ton("1");   // expected to be 1000000000
    const ASCII_VAL: Int = ascii("⚡"); // expected to be 14850721

    // Getter for TON_ONE
    get fun getTonOne(): Int {
        return self.TON_ONE;
    }

    // Getter for ASCII_VAL
    get fun getAsciiVal(): Int {
        return self.ASCII_VAL;
    }

    // Dummy receive function to ensure full compilation
    receive() {
        cashback(sender());
    }
}
