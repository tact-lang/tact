contract TestStringAsComment {
    const COMMENT_CELL: Cell = "hello".asComment();
    receive() {
        let c: Cell = "hello".asComment();
        require(self.COMMENT_CELL == c, "asComment constant mismatch");
    }
}
