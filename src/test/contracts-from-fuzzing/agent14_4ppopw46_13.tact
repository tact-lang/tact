contract TestHashData {
    receive() {
        // Test the hashData() function on a valid string with bits divisible by 8
        let s: String = "Test hashData!"; // 15 characters, good
        dump(s.hashData());
    }
}
