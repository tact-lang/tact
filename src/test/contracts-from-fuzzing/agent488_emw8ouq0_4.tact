contract ManyFieldsContract {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Address;
    f: Cell;
    g: Slice;
    h: String;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
    m: Int;
    n: Bool;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = false;
        self.e = myAddress();
        self.f = emptyCell();
        self.g = emptyCell().asSlice();
        self.h = "str";
        self.i = null;
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = 42;
        self.n = false;
    }
}