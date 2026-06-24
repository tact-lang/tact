contract ManyFieldsWithSerialization {
    a: Int as uint8;
    b: Bool;
    c: Cell;
    d: Slice;
    e: String;
    f: Int as int16;
    g: Int as uint32;
    h: Int as int64;
    i: Int as uint120;
    j: Int;

    init() {
        self.a = 1;
        self.b = false;
        self.c = emptyCell();
        self.d = emptyCell().asSlice();
        self.e = "z";
        self.f = -33;
        self.g = 44;
        self.h = -55;
        self.i = 66;
        self.j = 77;
    }
}