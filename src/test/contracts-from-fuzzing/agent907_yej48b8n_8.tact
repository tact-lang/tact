contract ManyPrimitiveFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: Int?;
    i: Bool?;
    j: Address?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.g = myAddress();
        self.h = null;
        self.i = null;
        self.j = null;
    }
}