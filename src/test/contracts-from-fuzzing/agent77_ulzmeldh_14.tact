contract Test {
    receive() {
        // Test hashData function on a valid string with bits divisible by 8
        let hash: Int = "Never gonna give you up!".hashData();
    }
}
