contract BigTypes {
    i: Int;
    b: Bool;
    addr: Address;
    c: Cell;
    s: Slice;
    str: String;

    init() {
        self.i = 1;
        self.b = true;
        self.addr = myAddress();
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
        self.str = "test";
    }
}