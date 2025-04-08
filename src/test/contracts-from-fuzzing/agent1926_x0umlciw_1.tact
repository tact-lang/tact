contract Test1 {
    a: Int;
    b: Bool;
    c: Cell;
    d: Address;
    e: Slice;
    f: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell();
        self.d = myAddress();
        self.e = emptyCell().asSlice();
        self.f = "test";
    }
}