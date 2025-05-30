contract ManyFields {
    a: Int;
    b: Int?;
    c: Cell;
    d: Bool;
    e: Address;
    f: String;
    g: String?;
    h: Slice;
    i: Int;
    j: Bool;
    k: Address;
    l: Cell;

    init() {
        self.a = 1;
        self.b = null;
        self.c = emptyCell();
        self.d = true;
        self.e = myAddress();
        self.f = "a";
        self.g = null;
        self.h = emptyCell().asSlice();
        self.i = 9;
        self.j = false;
        self.k = myAddress();
        self.l = emptyCell();
    }
}