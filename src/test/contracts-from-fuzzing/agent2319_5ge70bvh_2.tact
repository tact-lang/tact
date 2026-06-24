contract TestContract {
    foo: Int;
    bar: Bool;
    addr: Address;
    sliceVal: Slice;
    cellVal: Cell;
    str: String;

    init() {
        self.foo = 1;
        self.bar = true;
        self.addr = myAddress();
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.str = "hello";
    }
}
