contract ManyPrimitiveFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.g = null;
        self.h = false;
        self.i = null;
        self.j = null;
    }
}
