contract Wide {
    a: Int as uint8;
    b: Int as int8;
    c: Int as int64;
    d: Int as uint64;
    e: Bool;
    f: String;
    g: Address;
    h: Cell;
    i: Slice;

    init() {
        self.a = 1;
        self.b = -1;
        self.c = 123456789;
        self.d = 987654321;
        self.e = true;
        self.f = "wide";
        self.g = myAddress();
        self.h = emptyCell();
        self.i = emptyCell().asSlice();
    }
}