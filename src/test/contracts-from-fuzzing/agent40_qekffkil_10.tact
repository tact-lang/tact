contract TestSerializedCellGetter {
    get fun getData(): Cell {
        return beginCell().storeUint(42, 7).endCell();
    }
    
    receive() {}
}
