contract PrimitiveFields {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;

    init() {
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "hello";
    }
}