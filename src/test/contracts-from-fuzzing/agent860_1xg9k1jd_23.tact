contract DefaultFallbacks {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: Cell;
    h: Cell?;
    i: String;
    j: String?;

    init() {
        self.a = 0;
        self.b = null;
        self.c = false;
        self.d = null;
        self.e = myAddress();
        self.f = null;
        self.g = emptyCell();
        self.h = null;
        self.i = "";
        self.j = null;
    }
}