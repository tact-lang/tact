contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
    g: String;
    h: Bool;
    i: Int;
    j: Cell;
    k: Address;
    l: String;
    m: Int;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = emptyCell();
        self.e = myAddress();
        self.f = emptyCell().asSlice();
        self.g = "def";
        self.h = false;
        self.i = -123;
        self.j = emptyCell();
        self.k = myAddress();
        self.l = "ghi";
        self.m = 999;
    }
}