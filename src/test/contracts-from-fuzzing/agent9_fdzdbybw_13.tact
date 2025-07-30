contract TestCompileTime {
    fun test() {
        // Testing compile-time functions that compute at compile time.
        // sha256 should compute and produce a compile-time constant of type Int.
        let hash = sha256("compile time test");
        dump(hash);

        // ton converts string representation to intuitive nanoTon value.
        let tonValue = ton("1"); // Expect 1000000000
        dump(tonValue);
    }

    receive() {
        self.test();
    }
}
