contract TestContract {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Int as uint8;
    f: Int as int128;
    g: Bool;
    h: Int?;
    i: Bool?;
    j: Address?;
    k: Cell?;

    init() {
        self.a = 10;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = 255;
        self.f = -42;
        self.g = false;
        self.h = null;
        self.i = null;
        self.j = null;
        self.k = null;
    }
}