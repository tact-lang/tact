contract MultiFieldContract {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Int;
    g: Bool;
    h: String;
    i: Cell;
    j: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = emptyCell();
        self.e = myAddress();
        self.f = 2;
        self.g = false;
        self.h = "h";
        self.i = emptyCell();
        self.j = myAddress();
    }
}