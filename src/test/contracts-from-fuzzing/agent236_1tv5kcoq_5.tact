contract ManyPrimitiveFields {
    a: Bool;
    b: Int;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;

    init() {
        self.a = true;
        self.b = 123;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "test";
    }
}