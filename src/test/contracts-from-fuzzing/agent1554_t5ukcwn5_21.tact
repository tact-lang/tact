contract ManyFieldsOrder {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "foo";
        self.d = myAddress();
        self.e = null;
        self.f = true;
        self.g = null;
        self.h = null;
    }
}