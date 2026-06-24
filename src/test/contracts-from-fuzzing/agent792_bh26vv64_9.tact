contract TestContract {
    a: Int;
    b: Bool;
    c: Cell;
    d: Int;
    e: Bool;
    f: Cell;
    g: Int;
    h: Bool;
    i: Cell;
    j: Int;
    k: Bool;
    l: Cell;

    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell();
        self.d = 2;
        self.e = false;
        self.f = emptyCell();
        self.g = 3;
        self.h = true;
        self.i = emptyCell();
        self.j = 4;
        self.k = false;
        self.l = emptyCell();
    }
}