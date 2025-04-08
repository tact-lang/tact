contract OptionalDefault {
    a: Int?;
    b: Bool = true;
    c: String?;
    d: Int = 10;

    init() {
        self.a = null;
        self.b = false;
        self.c = null;
        self.d = 20;
    }
}