contract ConstantTest2() {
    // Compile-time constant evaluated using the built-in function ascii.
    // Documentation says ascii("⚡") should produce a value equal to 14850721.
    const asciiValue: Int = ascii("⚡");

    // Function to return the value of the ascii constant via self
    fun getAscii(): Int {
        return self.asciiValue;
    }

    // Dummy receive to ensure the contract is fully compiled.
    receive() {}
}
