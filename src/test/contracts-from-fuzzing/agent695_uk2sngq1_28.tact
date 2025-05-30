contract JustPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Int?;
    f: Bool?;
    g: Address?;
    h: String?;

    init() {
        self.a = 5;
        self.b = true;
        self.c = myAddress();
        self.d = "s";
        self.e = null;
        self.f = false;
        self.g = null;
        self.h = null;
    }
}