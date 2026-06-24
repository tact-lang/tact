contract TestCell() {
    // Compile-time evaluation of cell constant from base64 string
    const MY_CELL: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

    receive() {
        // Convert cell to slice and dump the number of bits in the cell
        let s: Slice = self.MY_CELL.asSlice();
        dump(s.bits().toString());
    }
}
