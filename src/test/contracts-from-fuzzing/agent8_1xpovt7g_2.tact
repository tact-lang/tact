contract TestAscii() {
    // Test constant evaluation for the compile-time function ascii
    const MY_CONSTANT: Int = ascii("⚡");
    
    receive() {
        // Access constant as a contract-level constant via self
        require(self.MY_CONSTANT == 14850721, "ascii constant mismatch");
        cashback(sender());
    }
}