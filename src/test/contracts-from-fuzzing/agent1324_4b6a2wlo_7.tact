contract MixedTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Bool?;
    g: String?;
    h: Int?;
    i: Cell?;
    j: Slice?;

    init() {
        self.a = 123;
        self.b = true;
        self.c = "text";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = false;
        self.g = "maybe";
        self.h = 456;
        self.i = null;
        self.j = null;
    }
}