contract Test {
    // Testing basic arithmetic operator precedence: multiplication vs addition
    fun addTest(): Int {
        // Expected result: 1 + (2 * 3) = 7
        return 1 + 2 * 3;
    }

    receive() {
        // Call the function to ensure it is compiled
        self.addTest();
    }
}
