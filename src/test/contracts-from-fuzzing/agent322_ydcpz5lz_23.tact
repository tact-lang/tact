contract Test {
    str: String;
    addr: Address;
    c: Cell;
    s: Slice;
    b: Bool;

    init() {
        self.str = "abc";
        self.addr = myAddress();
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
        self.b = false;
    }
}