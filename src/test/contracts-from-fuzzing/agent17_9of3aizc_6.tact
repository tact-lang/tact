contract ConstCellTest() {
    // Testing compile-time evaluation of cell() built-in with a valid Base64 string
    // Define a contract-level constant
    const cell_val: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

    receive() {
        // Reference the constant using self.cell_val
        let c: Cell = self.cell_val;
        cashback(sender());
    }
}
