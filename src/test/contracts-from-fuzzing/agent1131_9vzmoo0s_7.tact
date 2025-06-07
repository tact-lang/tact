contract MixedSerialization {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;
    d: Bool;
    e: Address;

    init() {
        self.a = 7;
        self.b = -42;
        self.c = ton("1");
        self.d = false;
        self.e = myAddress();
    }
}