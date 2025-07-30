contract TestSHA256 {
    // Test constant evaluation of compile-time-only function sha256
    // The SHA256 hash of "abc" is well-known:
    // BA7816BF8F01CFEA414140DE5DAE2223B00361A396177A9CB410FF61F20015AD
    // We'll represent it as a 256-bit integer literal in hexadecimal form.
    
    const HASH: Int = sha256("abc");
    const EXPECTED_HASH: Int = 0xBA7816BF8F01CFEA414140DE5DAE2223B00361A396177A9CB410FF61F20015AD;
    
    receive() {
        dump(self.HASH);
        dump(self.EXPECTED_HASH);
    }
}
