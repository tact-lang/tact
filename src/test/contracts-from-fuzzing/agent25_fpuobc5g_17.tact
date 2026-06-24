contract Test {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Int?;
    g: Bool?;
    h: String;
    i: Address;
    j: Cell;
    init() {
        self.a = 1;
        self.b = true;
        self.c = "x";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = null;
        self.g = false;
        self.h = "y";
        self.i = myAddress();
        self.j = emptyCell();
    }
}