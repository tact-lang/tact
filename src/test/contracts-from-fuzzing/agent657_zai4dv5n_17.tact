contract ManyOptionalsAndDefaults {
    a: Int?;
    b: Bool = true;
    c: String?;
    d: Int = 42;
    e: String = "test";

    init() {
        self.a = null;
        self.c = null;
    }
}