contract MixedOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Int;
    f: Bool;
    g: Address;
    h: String;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = 1;
        self.f = true;
        self.g = myAddress();
        self.h = "hi";
    }
}