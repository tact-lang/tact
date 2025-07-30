contract AllPrimitiveFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Builder;
    f: Slice;
    g: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = beginCell();
        self.f = emptyCell().asSlice();
        self.g = "hi";
    }
}