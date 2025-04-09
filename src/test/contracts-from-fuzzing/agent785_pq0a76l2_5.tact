contract PrimitiveFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.g = myAddress();
    }
}
