contract TestExtension {
    fun showcase() {
        // Test extension function call on a string literal: asComment() should convert the string to a cell with 32 zero bits prefixed.
        dump("hello".asComment());
    }

    receive() {
        self.showcase();
    }
}