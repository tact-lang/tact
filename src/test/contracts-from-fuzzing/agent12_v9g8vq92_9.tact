contract TestContract {
    // Test 6: Using hashData() on a valid string
    receive() {
        // "Hello" is 5 characters, 40 bits total, which is divisible by 8
        let h: Int = "Hello".hashData();
    }
}
