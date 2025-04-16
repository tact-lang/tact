contract Test {
    receive() {
        // testing using an empty string literal
        let s: String = "";
        dump(s);
    }

    fun dump(s: String) {
        // no-op dump function
    }
}
