contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Int?;
    f: Bool?;
    g: Address?;
    h: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "d";
        self.e = null;
        self.f = false;
        self.g = null;
        self.h = "h";
    }
}