contract BoolTest {
    // Testing boolean operators and operator precedence in conditions
    fun boolTest(a: Int, b: Int): Bool {
        // Expected: evaluates to true if a > 5 and b < 3
        return a > 5 && b < 3;
    }

    receive() {
        // Call the function to force its inclusion in the compiled project
        self.boolTest(6, 2);
    }
}
