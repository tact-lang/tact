contract EmptyDefaults {
    a: Int;
    b: Bool;
    str: String;
    addr: Address;
    cl: Cell;
    sl: Slice;

    init() {
        self.a = 0;
        self.b = false;
        self.str = "";
        self.addr = myAddress();
        self.cl = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}