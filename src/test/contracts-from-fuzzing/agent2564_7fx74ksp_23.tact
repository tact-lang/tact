contract JustPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Builder;
    g: Slice;

    init() {
        self.a = 0;
        self.b = false;
        self.c = "";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = beginCell();
        self.g = emptyCell().asSlice();
    }
}