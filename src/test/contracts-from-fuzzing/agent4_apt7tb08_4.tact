contract Test {
    // Test if-else behavior: returns true if x is positive, false otherwise
    fun boolTest(x: Int): Bool {
        if (x > 0) {
            return true;
        } else {
            return false;
        }
    }

    receive() {
        self.boolTest(1);
    }
}
