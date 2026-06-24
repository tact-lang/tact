contract TestSliceGet {
    s: Slice;

    init() {
         let cell = beginCell().storeUint(256, 16).endCell();
         self.s = cell.asSlice();
    }

    receive () {}

    get fun getSlice(): Slice {
         return self.s;
    }
}
