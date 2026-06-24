contract ManyTypes {
    foo: Int;
    bar: Bool;
    baz: Address;
    qux: String;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = myAddress();
        self.qux = "hi";
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.sliceVal = emptyCell().asSlice();
    }
}
