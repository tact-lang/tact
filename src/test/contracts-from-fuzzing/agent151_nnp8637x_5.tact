contract Test {
    a: Int?;
    b: Bool;
    c: String?;
    d: Address;
    e: Bool?;
    f: Int;

    init() {
        self.a = null;
        self.b = true;
        self.c = "xyz";
        self.d = myAddress();
        self.e = false;
        self.f = 999;
    }
}