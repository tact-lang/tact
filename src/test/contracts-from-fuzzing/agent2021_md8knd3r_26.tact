contract MixPrimitiveFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = emptyCell();
        self.e = myAddress();
        self.f = emptyCell().asSlice();
    }
}
