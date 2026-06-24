contract ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = "hi";
        self.f = null;
        self.g = myAddress();
        self.h = null;
    }
}