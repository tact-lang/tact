contract Test {
    fun test() {
        try {
            throw(42);
        } catch (e) {
            // Expect e to be 42 as per documentation
            dump(e);
        }
    }

    receive() {
        self.test();
    }
}
