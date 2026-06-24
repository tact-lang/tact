contract Test {
    a: Int;
    b: Bool?;
    c: Bool;
    d: String?;
    e: String;
    f: Int?;
    g: Int;
    h: Address?;
    i: Address;
    j: Cell?;
    k: Cell;

    init() {
        self.a = 1;
        self.b = null;
        self.c = false;
        self.d = null;
        self.e = "e";
        self.f = null;
        self.g = 7;
        self.h = null;
        self.i = myAddress();
        self.j = null;
        self.k = emptyCell();
    }
}