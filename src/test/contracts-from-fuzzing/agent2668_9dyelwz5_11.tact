contract ManyPrimitives {
    intval: Int;
    boolval: Bool;
    str: String;
    s: Slice;
    c: Cell;
    addr: Address;

    init() {
        self.intval = 1;
        self.boolval = true;
        self.str = "abc";
        self.s = emptyCell().asSlice();
        self.c = emptyCell();
        self.addr = myAddress();
    }
}
