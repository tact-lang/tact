contract DebugOptionalSlice {
    receive() {
        let cell: Cell = beginCell().storeUint(513, 10).endCell();
        let s: Slice = cell.beginParse();
        let opt: Slice? = s;
        dump(opt);
    }
}
