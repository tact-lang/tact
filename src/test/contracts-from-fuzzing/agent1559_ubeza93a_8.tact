contract LargeOptionMix {
    a: Int?;
    b: Int;
    c: Bool?;
    d: String;
    e: Cell?;
    f: String?;
    g: Address;
    h: Bool;
    i: Cell;

    init() {
        self.a = null;
        self.b = 2;
        self.c = null;
        self.d = "d";
        self.e = null;
        self.f = null;
        self.g = myAddress();
        self.h = true;
        self.i = emptyCell();
    }
}