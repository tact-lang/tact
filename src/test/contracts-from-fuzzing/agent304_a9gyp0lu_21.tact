contract MixPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
    }
}