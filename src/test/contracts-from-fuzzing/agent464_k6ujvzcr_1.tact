contract TestContract {
    a: Int;
    b: Bool;
    c: Slice;
    d: Address;
    e: Cell;
    f: String;
    g: Int?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell().asSlice();
        self.d = myAddress();
        self.e = emptyCell();
        self.f = "test";
        self.g = null;
    }
}