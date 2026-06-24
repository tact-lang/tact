contract Test {
    // Testing if-else statement behavior and proper compilation based on condition evaluation
    fun absolute(x: Int): Int {
        if (x >= 0) {
            return x;
        } else {
            return -x;
        }
    }

    receive() {
        // Force compilation of the absolute function by calling it
        self.absolute(-5);
    }
}
