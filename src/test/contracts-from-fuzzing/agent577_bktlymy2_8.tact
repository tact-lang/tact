contract ManyPrimitives {
    a: Int;
    b: Int as uint8;
    c: Int as uint32;
    d: Int as int64;
    e: Int as coins;
    f: Bool;
    g: String;
    h: Address;
    i: Cell;
    j: Slice;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = true;
        self.g = "hi";
        self.h = myAddress();
        self.i = emptyCell();
        self.j = emptyCell().asSlice();
    }
}
