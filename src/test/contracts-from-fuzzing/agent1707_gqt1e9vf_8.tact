contract LongList {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: Address;
    g: Cell;
    h: String;
    i: Int;
    j: Bool;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = false;
        self.e = "x";
        self.f = myAddress();
        self.g = emptyCell();
        self.h = "y";
        self.i = 9;
        self.j = false;
    }
}