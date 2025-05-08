contract LargePrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int;
    h: Bool;
    i: String;
    j: Address;
    k: Cell;
    l: Slice;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "foo";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = 2;
        self.h = true;
        self.i = "bar";
        self.j = myAddress();
        self.k = emptyCell();
        self.l = emptyCell().asSlice();
    }
}