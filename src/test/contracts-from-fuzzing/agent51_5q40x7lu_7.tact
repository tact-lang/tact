contract TestCell {
    // Using the built-in compile-time function cell() to create a Cell from a base64 string.
    // According to the documentation, cell("te6cckEBAQEAAgAAAEysuc0=") should produce an empty Cell.
    // We then obtain a Slice from that Cell and return the number of bits in that Slice.
    // An empty Cell is expected to have 0 bits.
    const EMPTY_CELL: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

    get fun getBitLength(): Int {
        let s: Slice = self.EMPTY_CELL.asSlice();
        return s.bits();
    }
}
