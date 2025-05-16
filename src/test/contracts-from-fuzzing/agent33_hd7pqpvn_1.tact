contract Test {
    foo: Int;
    bar: Bool;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    str: String;

    init() {
        self.foo = 1;
        self.bar = true;
        self.addr = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.str = "Hello";
    }
}