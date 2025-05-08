contract NoDefaults {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: String;
    init() {
        self.a = 0;
        self.b = false;
        self.c = emptyCell();
        self.d = emptyCell().asSlice();
        self.e = myAddress();
        self.f = "";
    }
}