contract LargeMultiType {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    addr: Address;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "Hi";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.addr = myAddress();
    }
}