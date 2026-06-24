contract Test {

    // Correct usage by calling using self.
    fun add(a: Int, b: Int): Int {
        return a + b;
    }

    receive() {
        let result = self.add(2, 3);
    }
}
