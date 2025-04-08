contract OptionalAndDefaults {
    a: Int?;
    b: Bool = false;
    s: String?;

    init() {
        self.a = null;
        self.b = true;
        self.s = "zzz";
    }
}