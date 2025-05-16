contract Test {
    // Test 1: Regular function early return in if branch
    fun test(x: Int) : Int {
        if (x > 0) {
            return 42;
        }
        return -1;
    }

    receive() {}
}