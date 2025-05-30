contract VariousTypes {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    sl: Slice;
    cl: Cell;
    bu: Builder;

    init() {
        self.i = 42;
        self.b = true;
        self.s = "test";
        self.addr = myAddress();
        self.sl = emptyCell().asSlice();
        self.cl = emptyCell();
        self.bu = beginCell();
    }
}