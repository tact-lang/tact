contract TestStringAsComment {
    fun test() {
        // Testing the asComment extension method for String literals
        // It should convert this string into a Cell with a 32 zero bits prefix.
        let cellComment: Cell = "test message".asComment();
        dump(cellComment);
        
        // Additionally, we can convert it back to a slice and then load the prefix bits
        let s: Slice = cellComment.asSlice();
        // Assuming that the cell was constructed with 32 zero bits prefix, skip them
        let _ = s.loadUint(32);
        // The rest of the slice corresponds to the string bytes; we can't easily dump as a string, so test ends here.
    }

    receive() {
        self.test();
    }
}
