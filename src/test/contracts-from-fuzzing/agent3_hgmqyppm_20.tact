contract TestDumpOptionalCell {
    receive() {
        let a: Cell? = beginCell().storeUint(9, 8).endCell();
        dump(a);
    }
}
