contract TestDumpCell {
    receive() {
        let cell: Cell = beginCell().storeUint(7, 8).endCell();
        dump(cell);
    }
}
