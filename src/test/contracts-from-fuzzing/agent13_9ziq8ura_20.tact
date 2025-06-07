contract DeepDefaults {
    a: Int = 5;
    b: Bool = false;
    c: Int?;
    d: Bool?;

    init() {
        self.a = 42;
        self.b = true;
        self.c = null;
        self.d = null;
    }
}