contract Test {
    receive() {
        // Fuzz test: Create a rawSlice with bit padding (underscore) and then convert it to String.
        // According to documentation, rawSlice("4a_") produces a slice with a non-multiple-of-8 bit length.
        // Converting such a slice to a String using asString() should likely trigger an error or unexpected behavior.
        let s: String = rawSlice("4a_").asString();
        dump(s);
    }
}
