contract TestCastExpressions {
    receive() {
        // Casting an integer literal to a string via extension functions, then to a comment Cell
        let cellResult: Cell = 12345.toString().asComment();
        // Casting a string literal to a cell via asComment and then to a Slice
        let commentCell: Cell = "Tact Casting Test".asComment();
        let s: Slice = commentCell.asSlice();
    }
}
