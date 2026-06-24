contract LargeOptionalCombo {
    a: Int?;
    b: Int;
    c: Bool?;
    d: Bool;
    e: String?;
    f: String;

    init() {
        self.a = null;
        self.b = 5;
        self.c = true;
        self.d = false;
        self.e = null;
        self.f = "done";
    }
}