contract TestCond {
    // Test simple if-else conditional behavior
    fun check(x: Int): Int {
        if (x > 0) {
            return 1;
        } else {
            return -1;
        }
    }

    receive() {
        // Testing with a positive value
        self.check(10);
    }
}
