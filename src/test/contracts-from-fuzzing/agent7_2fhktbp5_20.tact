contract TestFunctionCall {
    // A simple function to return the argument
    fun identity(x: Int): Int {
        return x;
    }

    receive() {
        // Calling the function with inline argument, using self reference
        let y: Int = self.identity(42);
        dump(y);
    }
}
