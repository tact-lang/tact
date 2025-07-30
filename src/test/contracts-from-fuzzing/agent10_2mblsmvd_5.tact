contract DebugSlice {
    receive() {
        let cell: Cell = beginCell().storeUint(513, 10).endCell();
        let s: Slice = cell.beginParse();
        dump(s);
    }
}
