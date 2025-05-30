contract Test {
    foo: Int;
    bar: Bool;
    addr: Address;
    str: String;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;

    init() {
        self.foo = 1;
        self.bar = true;
        self.addr = myAddress();
        self.str = "hello";
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
    }
}