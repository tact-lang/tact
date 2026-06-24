contract OptAndDefaults {
    a: Int?;
    b: Int = 5;
    c: Bool?;
    d: Bool = true;
    init() {
        self.a = null;
        self.c = false;
    }
}