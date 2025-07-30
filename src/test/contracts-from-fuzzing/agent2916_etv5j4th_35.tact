contract MixedSerialization {
    a: Int as int16;
    b: Bool;
    c: String;
    d: Address;
    e: Int as uint64;

    init() {
        self.a = -100;
        self.b = true;
        self.c = "a";
        self.d = myAddress();
        self.e = 123;
    }
}