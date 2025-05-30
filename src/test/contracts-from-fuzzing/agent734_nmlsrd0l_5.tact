contract LargePrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Builder;
    f: Slice;
    g: Address;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "hi";
        self.d = emptyCell();
        self.e = beginCell();
        self.f = emptyCell().asSlice();
        self.g = myAddress();
    }
}
