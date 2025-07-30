contract ManyFields {
    a: Int;
    b: Bool;
    c: Cell;
    d: Address;
    e: Slice;
    f: String;
    g: Int?;
    h: Address?;
    i: Bool?;
    j: String?;
    k: Slice?;
    l: Cell?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell();
        self.d = myAddress();
        self.e = emptyCell().asSlice();
        self.f = "test";
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
    }
}