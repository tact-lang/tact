contract GetterCellDynamic {
    receive() {}

    get fun getCellDynamic(): Cell {
        let c: Cell = beginCell().storeUint(42, 32).endCell();
        return c;
    }
}
