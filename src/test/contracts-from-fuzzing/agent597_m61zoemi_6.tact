contract ManyFieldsTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "x";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = null;
        self.h = true;
        self.i = "y";
        self.j = null;
        self.k = null;
        self.l = null;
    }
}