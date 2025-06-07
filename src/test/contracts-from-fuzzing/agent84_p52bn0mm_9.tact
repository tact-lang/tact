contract TestContract {
    receive() {
        // Test 6: String equality with hex escapes
        // "\x61\x62\x63" should be equivalent to "abc"
        let s1: String = "\x61\x62\x63";
        let s2: String = "abc";
        if (s1 != s2) {
            throw(1);
        }
    }
}
