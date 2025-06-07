contract Test {
    receive() {
        // Testing dump with a String, which is documented to be supported.
        dump("Hello, Tact!");
    }
}
