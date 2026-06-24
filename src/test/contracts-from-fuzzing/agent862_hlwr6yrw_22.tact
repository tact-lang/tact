contract EmptyDefaults {
    a: Int;
    b: Bool;
    s: String;
    addr: Address;
    c: Cell;
    sl: Slice;
    bu: Builder;

    init() {
        self.a = 1;
        self.b = true;
        self.s = "";
        self.addr = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.bu = beginCell();
    }
}
