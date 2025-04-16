contract TestContract {
    foo: Int;
    bar: Bool;
    baz: String;
    addr: Address;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = "hi";
        self.addr = myAddress();
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
    }
}