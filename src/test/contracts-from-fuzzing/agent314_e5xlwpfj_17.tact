contract OptionalsAndDefaults {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Int = 42;
    e: Bool = true;
    f: String = "hi";
    g: Slice?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.g = null;
    }
}