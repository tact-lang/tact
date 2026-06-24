contract ManyPrimitiveFields {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Builder;
    g: Address;
    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.d = emptyCell().asSlice();
        self.e = emptyCell();
        self.f = beginCell();
        self.g = myAddress();
    }
}
