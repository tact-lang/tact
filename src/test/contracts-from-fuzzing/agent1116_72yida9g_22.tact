contract WeirdDefaults {
    a: Int = 5;
    b: Int?; // optional, defaults to null
    c: Bool = false;
    d: Bool?;

    init() {
        self.a = 10;
        self.b = null;
        self.c = true;
        self.d = null;
    }
}
