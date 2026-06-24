contract Test {
    // Test 1: Regular function with early return inside if block
    fun f1(): Int {
        if (true) {
            return 10;
        }
        return 5;
    }

    receive () {}
}
