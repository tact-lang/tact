contract OptionalsDefaults {
    a: Int?;
    b: Int = 1;
    c: Bool?;
    d: String = "hi";

    init() {
        self.a = null;
        self.c = true;
    }
}