contract Test {
    // A simple function with two return paths, both returning Int
    fun test(x: Int): Int {
        if (x > 0) {
            return x;
        } else {
            return 0;
        }
    }

    // Use the function in a non-constant context to avoid compile-time eval limitations
    receive() {
        let y: Int = self.test(10);
        // just dump the result
        dump(y);
    }
}
