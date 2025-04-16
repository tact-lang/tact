contract TestChainedExtensions() {
    fun run() {
        // Chain extension functions: More than one extension call on a literal
        // "Hello".asComment() should produce a Cell
        let c: Cell = "Hello".asComment();
        // and then converting that Cell to a Slice should success
        let s: Slice = c.asSlice();
        dump(s);
    }

    receive() {
        self.run();
    }
}
