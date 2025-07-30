contract TestAscii {
    // Contract-level constant evaluating the ascii built-in compile-time function.
    // According to documentation, ascii("⚡") should be 14850721.
    const ASC: Int = ascii("⚡");
    
    receive() {
        require(self.ASC == 14850721, "Incorrect ascii constant evaluation");
        cashback(sender());
    }
}
