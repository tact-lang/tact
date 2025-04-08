contract LargeFlat {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Bool;
    f: Bool;
    g: String;
    h: String;
    i: Cell;
    j: Slice;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = true;
        self.f = false;
        self.g = "foo";
        self.h = "bar";
        self.i = emptyCell();
        self.j = emptyCell().asSlice();
    }
}