contract LargePrimitive {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;

    init() {
        self.a = 123;
        self.b = true;
        self.c = myAddress();
        self.d = "test";
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }
}