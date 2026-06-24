contract ManyPrimitives {
    a: Int = 1;
    b: Bool = true;
    c: String = "c";
    d: Slice;
    e: Cell;
    f: Address;

    init() {
        self.a = 2;
        self.b = false;
        self.c = "cc";
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = myAddress();
    }
}