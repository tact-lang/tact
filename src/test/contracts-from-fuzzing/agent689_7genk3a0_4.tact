contract ManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "test";
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
    }
}