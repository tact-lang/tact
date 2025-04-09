contract TestCellConversions {
    fun showcase() {
        // Testing conversion of a string to a comment cell.
        // According to documentation, asComment() prefixes a string with 32 zero bits.
        let cellComment: Cell = "test comment".asComment();
        let sliceComment: Slice = cellComment.asSlice();
        // Load the first 32 bits from the cell, they should be all zeros.
        let prefix = sliceComment.loadUint(32);
        dump(prefix); // expected output: 0
    }

    receive() {
        self.showcase();
    }
}
