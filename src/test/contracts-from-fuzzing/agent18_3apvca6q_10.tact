contract TestFunctionCalls {
    // A simple function to add two integers
    fun add(x: Int, y: Int): Int {
        return x + y;
    }

    receive() {
        // Now calling the internal function using self
        dump(self.add(1, 2));        // expected output: 3
        dump(self.add(10, 20));      // expected output: 30

        // Test method call chaining on literal (toString method on Int literal)
        dump(123.toString());    // expected output: "123"
    }
}
