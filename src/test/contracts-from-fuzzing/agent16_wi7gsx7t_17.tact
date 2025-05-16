contract TestAsComment() {
    // Test converting a string literal to a Cell using asComment() at compile time
    // According to the docs, asComment() prefixes the string with 32 zero bits
    // and then appends the UTF-8 encoded bytes of the string
    const commentCell: Cell = "test".asComment();

    // Getter to expose the number of bits in the resulting cell
    get fun getCommentBits() : Int {
         return self.commentCell.asSlice().bits();
    }

    receive() {
         cashback(sender());
    }
}
