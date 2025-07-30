contract LargeContract {
    a: Int;    b: Bool;      c: String;      d: Address?;
    e: String?; f: Int?;       g: Bool?;       h: Int as uint8;
    i: Int as int16;            j: Int as uint64; k: Int as int257;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "x";
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = 255;
        self.i = -30000;
        self.j = 1234567890123;
        self.k = -1;
    }
}