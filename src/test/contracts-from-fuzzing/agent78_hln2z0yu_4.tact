contract Test {
    // Test 3: Return inside a loop
    fun f(): Int {
        repeat (3) {
            return 7;
        }
        return 8;
    }

    receive () {}
}
