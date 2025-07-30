fun test_hash() {
    // String with length divisible by 8: simple ASCII-only string
    let s: String = "Test hash!";
    // Compute the hash of the string using SHA-256 of its data bits
    let h: Int = s.hashData();
    // For our test purpose, we simply compute it
}

contract Test {
    receive() {
        test_hash();
    }
}
