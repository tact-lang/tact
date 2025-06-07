contract TestDumpSlice {
    receive() {
        let cell: Cell = beginCell().storeUint(42, 8).endCell();
        let s: Slice = cell.beginParse();
        dump(s);
    }
}
