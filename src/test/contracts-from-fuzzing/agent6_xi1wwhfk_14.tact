contract TestStringAsComment() {
    fun test() {
        // Testing the expression: converting a string literal to a Cell using asComment()
        // According to documentation, this should produce a cell with the string prefixed with 32 zero bits.
        let cell: Cell = "TestComment".asComment();
        dump(cell);
    }

    receive() {
        self.test();
        cashback(sender());
    }
}
