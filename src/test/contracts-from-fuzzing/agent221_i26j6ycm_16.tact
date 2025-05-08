contract MixedSerialization {
    a: Int as int64;
    b: Int as uint8;
    c: String;
    d: Bool;
    e: Int;
    init() {
        self.a = 123456789;
        self.b = 255;
        self.c = "serialize";
        self.d = true;
        self.e = -987654321;
    }
}