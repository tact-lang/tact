contract MixedSerializations {
    a: Int as int8;
    b: Int as uint32;
    c: Int as coins;
    s: String;
    f: Bool;

    init() {
        self.a = -5;
        self.b = 123456;
        self.c = ton("1");
        self.s = "test";
        self.f = true;
    }
}