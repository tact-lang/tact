contract ManyDirectFields {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: String;
    f: Cell;
    g: Bool;
    h: Int;
    i: Slice;
    j: String;
    k: Cell;
    l: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
        self.e = "str";
        self.f = emptyCell();
        self.g = false;
        self.h = 10;
        self.i = emptyCell().asSlice();
        self.j = "txt";
        self.k = emptyCell();
        self.l = 42;
    }
}