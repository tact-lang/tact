contract ManyPrimitiveFields {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    init() {
        self.a = 1;
        self.b = false;
        self.c = "abc";
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = myAddress();
    }
}
