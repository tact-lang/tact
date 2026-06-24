contract OptsAndDefaults {
    a: Int?; //null
    b: Int = 5;
    c: Bool?; //null
    d: Bool = true;
    e: String?; //null
    f: String = "hello";

    init() {
        self.a = null;
        self.c = null;
        self.e = null;
        self.b = 10;
        self.d = false;
        self.f = "world";
    }
}
