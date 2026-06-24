contract Test1 {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: String;
    f: Address;
    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell();
        self.d = emptyCell().asSlice();
        self.e = "test";
        self.f = myAddress();
    }
}