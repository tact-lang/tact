contract TestSha256() {
    // Evaluate compile-time sha256 hash of a constant string
    // We use the well-known string "abc". The expected SHA-256 of "abc" is:
    // BA7816BF8F01CFEA414140DE5DAE2223B00361A396177A9CB410FF61F20015AD in hexadecimal.
    // However, Tact represents integers as 257-bit signed values, so we expect the integer representation to correspond to that.
    const hashValue: Int = sha256("abc");

    // Getter to expose the computed hash
    get fun getHash() : Int {
         return self.hashValue;
    }
}
