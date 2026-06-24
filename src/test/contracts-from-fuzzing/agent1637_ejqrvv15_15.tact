contract MultiOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;

    init() {
        self.a = null;
        self.b = 2;
        self.c = false;
        self.d = "hi";
    }
}