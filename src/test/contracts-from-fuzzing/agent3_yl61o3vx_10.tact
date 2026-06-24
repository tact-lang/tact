contract ConstCellTest {
    // Test compile-time evaluation of cell built-in function
    // The given base64 string should be embedded as a Cell
    const EMBEDDED_CELL: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

    receive() {
         // Convert the embedded cell to a slice and check its bit length
         let s: Slice = self.EMBEDDED_CELL.asSlice();
         // We expect the cell to have a non-zero bit length
         require(s.bits() > 0, "cell() did not load the expected cell data");
         cashback(sender());
    }
}
