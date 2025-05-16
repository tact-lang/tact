contract ManyPrimitives {
    inta: Int;
    boolb: Bool;
    addr: Address;
    cellx: Cell;
    slicez: Slice;
    str: String;

    init() {
        self.inta = 1;
        self.boolb = true;
        self.addr = myAddress();
        self.cellx = emptyCell();
        self.slicez = emptyCell().asSlice();
        self.str = "abc";
    }
}