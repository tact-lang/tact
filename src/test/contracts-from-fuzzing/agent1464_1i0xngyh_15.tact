contract SerializedMix {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint32;
    d: Bool;
    e: Bool?;
    f: String;
    g: Address;
    h: Cell;
    i: Slice;

    init() {
        self.a = 255;
        self.b = 0;
        self.c = 1000;
        self.d = true;
        self.e = null;
        self.f = "serialize";
        self.g = myAddress();
        self.h = emptyCell();
        self.i = self.h.asSlice();
    }
}
