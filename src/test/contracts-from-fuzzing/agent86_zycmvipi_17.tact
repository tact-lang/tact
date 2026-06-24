contract TestContract {
    receive() {
        // Test string hashData function on a string with length in bytes divisible by 8
        // "abc" is 3 bytes, 3*8=24 which is divisible by 8 (not a required length though, divisible means remainder zero)
        let s: String = "abc";
        let h: Int = s.hashData();
        dump(h);
    }
}
