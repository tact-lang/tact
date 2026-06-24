contract TestFunctionCallChain {
    // A simple function to add two integers. Note: Must be called using self.
    fun add(a: Int, b: Int): Int {
        return a + b;
    }

    receive() {
        // Inline function call using self.
        let result1: Int = self.add(2, 3);
        dump(result1); // expected output: 5

        // Chained function calls using self.
        let result2: Int = self.add(self.add(1, 2), self.add(3, 4));
        dump(result2); // expected output: 10
    }
}
