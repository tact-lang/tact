contract Test_SliceGetter {
    c: Cell;

    init() {
       self.c = beginCell().storeUint(123, 8).endCell();
    }

    receive() {}

    // Getter function returning a Slice parsed from a Cell
    get fun getSlice(): Slice {
         return self.c.beginParse();
    }
}
