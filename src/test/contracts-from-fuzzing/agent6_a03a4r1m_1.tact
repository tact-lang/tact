contract Test {
    receive () {}

    // Test case 1: Regular function with early return
    fun test_func(a: Int): Int {
        if (a < 0) {
            return -1;
        }
        return a;
    }
}