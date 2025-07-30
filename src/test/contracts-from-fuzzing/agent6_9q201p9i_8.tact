contract TestCell() {
    // Constant evaluated at compile-time using the cell built-in function
    const cell_val: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

    receive() {
        dump(self.cell_val);
        cashback(sender());
    }
}
