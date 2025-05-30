contract ExtremeLayout {
    a: Int as uint8;
    b: Int as int64;
    c: Address;
    d: Bool;
    e: Cell;
    f: String;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;

    init() {
        self.a = 10;
        self.b = -1000;
        self.c = myAddress();
        self.d = true;
        self.e = emptyCell();
        self.f = "hello";
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
    }
}