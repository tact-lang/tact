contract DebugCell {
    receive() {
        let cell_example = beginCell().storeUint(42, 8).endCell();
        dump(cell_example);
    }
}
