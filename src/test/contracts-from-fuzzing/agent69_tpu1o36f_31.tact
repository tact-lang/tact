contract ComplexDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
    d: Int?; // null by default
    e: Bool?; // null by default
    f: String?; // null by default

    init() {
        self.a = 55;
        self.b = false;
        self.c = "bye";
        self.d = 42;
        self.e = true;
        self.f = "changed";
    }
}