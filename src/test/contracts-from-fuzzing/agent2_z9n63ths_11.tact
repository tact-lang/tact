contract CellConversionExprTest {
    fun test() {
        // Testing conversion of a string literal to a Cell using asComment
        let cellFromStr: Cell = "Hello, TON!".asComment();
        dump(cellFromStr); // Expected to output a Cell representation starting with 32 zero bits
    }

    receive() {
        self.test();
    }
}
