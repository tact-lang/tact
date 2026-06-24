contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;

    init() {
        self.a = 123;
        self.b = true;
        self.c = "hi";
        self.d = myAddress();
        self.f = emptyCell();
        self.e = self.f.asSlice();
    }
}