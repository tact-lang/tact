// test mixed primitives directly on contract fields
contract PrimMix {
    a: Int;
    b: Bool;
    c: Bool?;
    d: String;
    e: Int?;
    f: Cell;
    g: Slice;
    h: Cell?;
    i: Slice?;

    init() {
        self.a = 123;
        self.b = true;
        self.c = null;
        self.d = "abc";
        self.e = null;
        self.f = emptyCell();
        self.g = emptyCell().asSlice();
        self.h = null;
        self.i = null;
    }
}