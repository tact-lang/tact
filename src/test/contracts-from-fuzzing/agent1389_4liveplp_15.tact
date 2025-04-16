contract ComboLarge {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Cell;
    f: Int?;
    g: Bool;
    h: String?;
    i: Address;
    j: Cell?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = "x";
        self.d = null;
        self.e = emptyCell();
        self.f = null;
        self.g = true;
        self.h = null;
        self.i = myAddress();
        self.j = null;
    }
}