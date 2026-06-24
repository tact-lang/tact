contract OptPrimsNested {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int;
    f: Bool;
    g: String;
    h: Address;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = 7;
        self.f = true;
        self.g = "str";
        self.h = myAddress();
    }
}