contract TestExtension {
    fun test() {
        // Testing extension function call on a string literal: asComment()
        let cell: Cell = "example".asComment();
        dump(cell);
    }

    receive() {
        self.test();
    }
}
