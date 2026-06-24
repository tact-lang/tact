contract ManyPrimitives {
    foo: Int;
    bar: Bool;
    addr: Address;
    strn: String;
    cellData: Cell;
    sliceData: Slice;
    builderData: Builder;

    init() {
        self.foo = 42;
        self.bar = true;
        self.addr = myAddress();
        self.strn = "hello";
        self.cellData = emptyCell();
        self.sliceData = emptyCell().asSlice();
        self.builderData = beginCell();
    }
}
