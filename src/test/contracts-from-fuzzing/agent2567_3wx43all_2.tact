contract ManyPrimitiveFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = emptyCell();
        self.e = self.d.asSlice();
        self.f = beginCell();
        self.g = myAddress();
    }
}