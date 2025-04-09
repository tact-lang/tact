contract MixSerial {
    a: Int as int64;
    b: Int as uint4;
    c: Int as coins;
    d: String;

    init() {
        self.a = 77;
        self.b = 3;
        self.c = ton("1");
        self.d = "abc";
    }
}
