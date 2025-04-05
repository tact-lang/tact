contract TestSha256() {
    // Compute SHA256 compile-time value from a string literal
    const TEST_SHA: Int = sha256("hello");

    // Getter to retrieve the computed constant
    get fun getSha() : Int {
         return self.TEST_SHA;
    }
}
