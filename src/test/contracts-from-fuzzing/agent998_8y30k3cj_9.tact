contract ManyPrimitives {
    intv: Int;
    boolv: Bool;
    addr: Address;
    cel: Cell;
    slicev: Slice;
    strv: String;

    init() {
        self.intv = 55;
        self.boolv = true;
        self.addr = myAddress();
        self.cel = emptyCell();
        self.slicev = emptyCell().asSlice();
        self.strv = "hi";
    }
}