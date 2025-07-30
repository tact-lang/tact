contract OptionsAndDefaults {
    a: Int?;
    b: Bool = false;
    c: String = "hello";
    d: String?;

    init() {
        self.a = null;
        self.d = null;
    }
}