contract ManyFieldsDifferentOrder {
    c: String;
    a: Int;
    e: Slice;
    f: Builder;
    b: Bool;
    d: Cell;
    j: Cell?;
    h: Bool?;
    g: Int?;
    i: String?;

    init() {
        self.a = 123;
        self.b = false;
        self.c = "foo";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
    }
}