contract MixedSerializations {
    a: Int as uint8 = 1;
    b: Int as int16 = -2;
    c: Int as coins = 1000;
    d: Int as int257 = -999999;
    e: Bool = true;
    f: Address;
    g: Cell;
    h: Slice;
    i: String = "mixed";

    init() {
        self.a = 2;
        self.b = -3;
        self.c = 2000;
        self.d = -888888;
        self.e = false;
        self.f = myAddress();
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = "init";
    }
}