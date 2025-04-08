contract TestContract {
    a: Int;
    b: Bool;
    c: Slice;
    d: Cell;
    e: Address;
    f: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell().asSlice();
        self.d = emptyCell();
        self.e = myAddress();
        self.f = "test";
    }
}