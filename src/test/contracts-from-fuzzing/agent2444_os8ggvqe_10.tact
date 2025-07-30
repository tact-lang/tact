contract MixedSerialization {
    a: Int as int64;
    b: Int as uint8;
    c: Int;
    d: Bool;
    e: String;

    init() {
        self.a = 123456789;
        self.b = 250;
        self.c = 100;
        self.d = true;
        self.e = "serialization";
    }
}
