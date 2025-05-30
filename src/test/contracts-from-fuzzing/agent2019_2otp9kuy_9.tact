contract JustPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "hello";
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }
}