contract ManyFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;
    k: Slice;
    l: Slice?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = "test";
        self.f = null;
        self.g = emptyCell();
        self.h = null;
        self.i = myAddress();
        self.j = null;
        self.k = emptyCell().asSlice();
        self.l = null;
    }
}