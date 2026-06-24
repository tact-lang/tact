contract MultiplePrimitiveFields {
    a: Int;
    b: Int as int64;
    c: Int as uint8;
    d: Bool;
    e: String;
    f: Cell;
    g: Address;
    h: Slice;
    i: Builder;

    init() {
        self.a = -1;
        self.b = 12345678;
        self.c = 255;
        self.d = true;
        self.e = "test";
        self.f = emptyCell();
        self.g = myAddress();
        self.h = emptyCell().asSlice();
        self.i = beginCell();
    }
}
