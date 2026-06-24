contract MixedOptionalsAndNon {
    a: Int?;
    b: Int;
    c: Bool?;
    d: Bool;
    e: Address?;
    f: Address;

    init() {
        self.a = null;
        self.b = 10;
        self.c = null;
        self.d = true;
        self.e = null;
        self.f = myAddress();
    }
}