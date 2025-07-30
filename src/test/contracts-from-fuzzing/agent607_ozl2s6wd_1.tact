contract Test {
    foo: Int;
    bar: Bool;
    baz: Address;
    txt: String;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = myAddress();
        self.txt = "hi";
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
    }
}