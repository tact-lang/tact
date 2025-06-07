contract OptionalsAndDefaults {
    a: Int?;
    b: Int = 42;
    c: Bool?;
    d: String = "hello";
    e: Bool = true;

    init() {
        self.a = null;
        self.c = false;
    }
}