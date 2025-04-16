contract SparseTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;

    init() {
        self.a = -100;
        self.b = false;
        self.c = "test";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }
}
