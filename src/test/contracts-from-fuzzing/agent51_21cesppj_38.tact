contract MixSerialized {
    a: Int as uint4;
    b: Bool;
    c: Int as int64;
    d: String;
    e: Int;

    init() {
        self.a = 15;
        self.b = false;
        self.c = -42;
        self.d = "serialize";
        self.e = 123456;
    }
}