// test persistent Cell and Slice fields and their interaction
contract CellSliceFields {
    c: Cell;
    s: Slice;

    init() {
        let cl = beginCell().storeUint(0,1).endCell();
        self.c = cl;
        self.s = cl.asSlice();
    }
}