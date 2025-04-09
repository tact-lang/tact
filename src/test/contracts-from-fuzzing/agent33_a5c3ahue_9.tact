contract Test {
    receive() {
        // Test string equality comparison
        let a: String = "test";
        let b: String = "test";
        if (a == b) {
            dump("Equal");
        } else {
            dump("Not Equal");
        }
    }

    fun dump(s: String) {
        // no-op dump function
    }
}
