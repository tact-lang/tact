contract Test {
    foo: Int = 1;
    bar: Bool = false;
    str: String = "hello";

    cellVal: Cell;
    sliceVal: Slice;
    addr: Address;

    init() {
        self.foo = 2;
        self.bar = true;
        self.str = "world";
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.addr = myAddress();
    }
}