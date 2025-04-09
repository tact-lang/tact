contract AllPrimTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Builder;
    f: Slice;
    g: String;

    init() {
        self.a = 11;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = beginCell();
        self.f = self.d.asSlice();
        self.g = "test";
    }
}