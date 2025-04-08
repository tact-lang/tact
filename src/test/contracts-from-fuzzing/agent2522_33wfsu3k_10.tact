contract TestContract {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;
    g: Address;
    h: Address?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = "test";
        self.d = null;
        self.e = true;
        self.f = null;
        self.g = myAddress();
        self.h = null;
    }
}