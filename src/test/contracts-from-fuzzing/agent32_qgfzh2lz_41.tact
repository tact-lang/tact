contract MultiOptInitialize {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.a = 5;
        self.a = null;
        self.b = true;
        self.b = null;
        self.c = "x";
        self.c = null;
    }
}
