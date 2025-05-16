contract MixedTypesTest {
    foo: Int;
    bar: Bool;
    baz: String;
    addr: Address;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = "hello";
        self.addr = myAddress();
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
        self.builderField = beginCell();
    }
}