contract StringExtTest {
    receive() {
        // Call asComment() on a string literal.
        // asComment() converts the string to a Cell with a 32-bit zero prefix and the UTF-8 bits of the string
        let cellComment = "hello".asComment();
        // Convert the cell to a slice using asSlice() and count the bits.
        let bitCount = cellComment.asSlice().bits();
        // For "hello" (5 bytes), expected bits = 5 * 8 + 32 = 72 bits, if that is the documented behavior
        dump(bitCount);
        cashback(sender());
    }

    get fun getCommentBits(): Int {
        // For the string "test", expected bits = 4*8 + 32 = 64
        return "test".asComment().asSlice().bits();
    }
}

fun main() {}
