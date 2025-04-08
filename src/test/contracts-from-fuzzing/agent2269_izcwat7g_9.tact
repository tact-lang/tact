contract OptionalsAndDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int?; // should default to null implicitly

    init() {
        self.a = 2;
        self.d = null;
    }
}
