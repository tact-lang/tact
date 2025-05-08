contract ConstSha256Test() {
    // Compute the sha256 hash of a test string twice
    const H1: Int = sha256("hello world");
    const H2: Int = sha256("hello world");
    
    // They should be equal if compile-time evaluation is deterministic
    receive() {
        require(self.H1 == self.H2, "sha256 compile-time evaluation is not deterministic");
        cashback(sender());
    }
}
