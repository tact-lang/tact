contract NestedDefaultInit {
    a: Int = 1;
    b: Bool = true;
    c: String = "str";
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.a = 77;
        self.b = false;
        self.c = "changed";
        self.d = 88;
        self.e = true;
        self.f = "opt";
    }
}
