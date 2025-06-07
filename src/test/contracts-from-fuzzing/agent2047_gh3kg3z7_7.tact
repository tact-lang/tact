contract ManyTypes {
    foo: Int;
    bar: Bool;
    baz: String;
    addr: Address;
    cell: Cell;
    builder: Builder;
    slice: Slice;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = "test";
        self.addr = myAddress();
        self.cell = emptyCell();
        self.builder = beginCell();
        self.slice = self.cell.asSlice();
    }
}