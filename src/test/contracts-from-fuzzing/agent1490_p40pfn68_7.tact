contract LongFieldsList {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Bool;
    f: String;
    g: Address;
    h: Int?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = true;
        self.f = "test";
        self.g = myAddress();
        self.h = null;
    }
}