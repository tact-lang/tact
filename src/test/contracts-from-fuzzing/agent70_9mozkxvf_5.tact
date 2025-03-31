contract Test {
    // Test function with a return statement
    fun getAnswer(): Int {
        return 42;
    }

    receive() {
        dump(self.getAnswer());
    }
}