contract TestCellConst {
    // Constant cell: testing compile-time evaluation of cell literal using the built-in cell() function
    // The cell value is provided as a Base64-encoded string
    const S: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

    fun run() {
        dump(self.S);
    }

    receive() {
        self.run();
        cashback(sender());
    }
}
