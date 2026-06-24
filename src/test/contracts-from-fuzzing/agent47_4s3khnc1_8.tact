contract TestCellBuiltinFixed() {
    // Test compile-time evaluation of the built-in function cell
    // This should convert a Base64 string to a Cell at compile-time
    const B: Cell = cell("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");

    receive() {
        // Convert Cell to Slice and then dump the number of bits
        dump(self.B.asSlice().bits());
        cashback(sender());
    }
}
