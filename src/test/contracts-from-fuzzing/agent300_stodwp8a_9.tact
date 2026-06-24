contract TestContract {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool;
    f: String;
    g: String;
    h: Address;
    i: Cell;
    j: Cell;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
        self.e = false;
        self.f = "alpha";
        self.g = "beta";
        self.h = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.i = emptyCell();
        self.j = emptyCell();
    }
}