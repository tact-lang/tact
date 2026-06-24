contract LongPrimitiveSequence {
    a: Int;
    b: Bool;
    c: Int as uint8;
    d: Bool;
    e: Int as int64;
    f: String;
    g: Cell;
    h: Slice;
    i: Int?;
    j: Bool?;

    init() {
        self.a = 11;
        self.b = true;
        self.c = 255;
        self.d = false;
        self.e = -5000;
        self.f = "ok";
        self.g = emptyCell();
        self.h = "ok".asSlice();
        self.i = null;
        self.j = true;
    }
}