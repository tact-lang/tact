contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    init() {
        self.a = 1;
        self.b = true;
        self.c = "test";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
    }
}