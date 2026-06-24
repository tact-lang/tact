contract OnlyFields {
    a: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    addr: Address;

    init() {
        self.a = 0;
        self.b = false;
        self.s = "";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.bu = beginCell();
        self.addr = myAddress();
    }
}