contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Builder;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.g = beginCell();
    }
}