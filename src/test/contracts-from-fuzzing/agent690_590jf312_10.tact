contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Address;
    f: Cell;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Slice;
    k: Cell;
    l: Bool;
    m: Address;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "hi";
        self.d = emptyCell().asSlice();
        self.e = myAddress();
        self.f = emptyCell();
        self.g = null;
        self.h = true;
        self.i = null;
        self.j = emptyCell().asSlice();
        self.k = emptyCell();
        self.l = true;
        self.m = myAddress();
    }
}