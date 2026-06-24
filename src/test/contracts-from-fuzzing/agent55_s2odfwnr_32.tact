contract EmptyDefaults {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;

    init() {
        self.a = 0;
        self.b = false;
        self.c = "";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = self.e.asSlice();
    }
}
