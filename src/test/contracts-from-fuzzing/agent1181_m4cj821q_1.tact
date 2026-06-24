contract TestContract {
    a: Bool;
    b: Int;
    c: Cell;
    d: Slice;
    e: String;
    f: Address;

    init() {
        self.a = true;
        self.b = 1;
        self.c = emptyCell();
        self.d = self.c.asSlice();
        self.e = "hi";
        self.f = myAddress();
    }
}