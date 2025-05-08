contract DifferentOrder {
    b: Bool;
    n: Int;
    s: Slice;
    str: String;
    addr: Address;
    c: Cell;

    init() {
        self.b = true;
        self.n = 99;
        self.s = emptyCell().asSlice();
        self.str = "string";
        self.addr = myAddress();
        self.c = emptyCell();
    }
}