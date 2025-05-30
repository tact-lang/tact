contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Address;
    f: Cell;
    g: Slice;
    h: String;
    i: Bool;
    j: Int;
    k: Address;
    l: Int?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "test";
        self.d = null;
        self.e = myAddress();
        self.f = emptyCell();
        self.g = self.f.asSlice();
        self.h = "hi";
        self.i = true;
        self.j = -5;
        self.k = self.e;
        self.l = 99;
    }
}
