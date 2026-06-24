contract Test {
    fun testAssignment(): Int {
        let value: Int = 5;
        value += 7; // Augmented assignment
        return value;
    }

    receive() {
        let result: Int = self.testAssignment();
        result;
    }
}
