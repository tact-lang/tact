contract TestCellAndSlice {
    receive() {
        // Testing conversion: Cell → Slice → loadUint
        let cell: Cell = beginCell().storeUint(42, 8).endCell();
        let slice: Slice = cell.beginParse();
        let value: Int = slice.loadUint(8);
        value; // expected: 42
    }
}
