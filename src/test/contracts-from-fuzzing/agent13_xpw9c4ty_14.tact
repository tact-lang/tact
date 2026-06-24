contract CellSliceExprTest() {
    fun test() {
        // Test conversion of a string literal to a Cell using asComment, then convert to Slice
        let str: String = "Test comment";
        let cell: Cell = str.asComment();
        let slice: Slice = cell.asSlice();
        dump(slice);
    }

    receive() {
        self.test();
    }
}
