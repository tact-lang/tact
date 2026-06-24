contract PrimitiveMixSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int;
    d: Bool;
    e: Bool;
    f: Bool;
    g: String;
    h: String;

    init() {
        self.a = 8;
        self.b = -16;
        self.c = 1000;
        self.d = true;
        self.e = false;
        self.f = true;
        self.g = "hi";
        self.h = "bye";
    }
}
