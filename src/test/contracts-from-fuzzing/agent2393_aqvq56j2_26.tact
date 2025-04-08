contract StringsAndDefaults {
    s1: String = "string";
    s2: String? = null;

    init() {
        self.s2 = "other";
    }
}