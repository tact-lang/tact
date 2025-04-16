contract OptionalsAndDefaults {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: String?;

    init() {
        self.b = null;
        self.d = null;
    }
}