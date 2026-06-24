contract ManyFieldsContract {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
    i: Int;
    j: Bool;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "str";
        self.d = myAddress();
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = null;
        self.i = -100;
        self.j = false;
    }
}
