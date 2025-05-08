contract TestManyFields {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Int?;
    f: String?;
    g: Bool?;
    h: Address?;

    init() {
        self.a = 1;
        self.b = "x";
        self.c = false;
        self.d = myAddress();
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = null;
    }
}