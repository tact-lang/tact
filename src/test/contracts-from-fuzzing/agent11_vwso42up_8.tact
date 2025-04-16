contract CellSliceGetter2 {
    cell_var: Cell;

    init() {
        self.cell_var = beginCell().storeUint(123, 8).endCell();
    }

    receive() {}

    // Getter function that returns a Slice derived from cell_var
    get fun get_slice() : Slice {
        return self.cell_var.beginParse();
    }
}
