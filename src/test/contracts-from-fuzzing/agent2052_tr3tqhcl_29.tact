contract OptionalInitializer {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.a = 42;
        self.b = null;
        self.c = "hi";
    }
}