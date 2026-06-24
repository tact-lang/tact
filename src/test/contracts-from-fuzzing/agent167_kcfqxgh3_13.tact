contract OptionalMixed {
    a: Int?;
    b: Bool = false;
    c: String?;
    d: Bool?;
    e: String = "hi";
    f: Int = 42;

    init() {
        self.a = 1;
        self.c = "test";
        self.d = true;
    }
}