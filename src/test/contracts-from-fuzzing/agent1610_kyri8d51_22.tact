contract ManyPrimitiveFields {
    intf: Int;
    boolf: Bool;
    addr: Address;
    cellf: Cell;
    slice: Slice;
    str: String;

    init() {
        self.intf = 42;
        self.boolf = true;
        self.addr = myAddress();
        self.cellf = emptyCell();
        self.slice = emptyCell().asSlice();
        self.str = "test";
    }
}