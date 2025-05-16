contract ManyFields {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Builder;
    f: Address;
    g: String;
    h: Int?;
    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell();
        self.d = emptyCell().asSlice();
        self.e = beginCell();
        self.f = myAddress();
        self.g = "test";
        self.h = null;
    }
}