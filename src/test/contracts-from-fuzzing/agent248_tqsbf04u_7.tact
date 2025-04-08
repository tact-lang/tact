contract SerializeWidths {
    a: Int as int8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as uint4;
    e: Int; // default int257
    f: Int as uint251;
    g: Int as int64;
    h: Int as uint1;
    i: Int?;
    j: Bool;
    k: String;

    init() {
        self.a = -5;
        self.b = 65535;
        self.c = -9999;
        self.d = 15;
        self.e = 12345;
        self.f = 12345678901234;
        self.g = -12345678;
        self.h = 1;
        self.i = null;
        self.j = true;
        self.k = "serialize widths";
    }
}