contract OptionalFieldsDirect {
    a: Int?;
    b: String?;
    c: Bool?;

    init() {
        self.a = null;
        self.b = "hello";
        self.c = null;
    }
}