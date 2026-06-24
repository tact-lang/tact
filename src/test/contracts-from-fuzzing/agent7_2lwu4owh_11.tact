contract TestAscii {
    fun showcase() {
        // Test the ascii() function on a Unicode string literal "👻".
        // The output is expected to be a compile-time computed integer value representative of the UTF-8 or code points.
        // The exact value may not be standardized for multiple characters, but should be consistent.
        dump(ascii("👻"));
    }

    receive() {
        self.showcase();
    }
}
