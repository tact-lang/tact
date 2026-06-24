contract Test {
    receive() {
        // Test String.hashData with a string having length divisible by 8 bits (each byte 8 bits)
        let h: Int = "abc".hashData();
        let dummy = h;
    }
}
