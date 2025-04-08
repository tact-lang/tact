contract ManyPrimitiveFields {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Address;
    e: Cell;
    f: Slice;

    init() {
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }
}