contract OnlyOptionalStrings {
    s1: String?;
    s2: String?;

    init() {
        self.s1 = "hi";
        self.s2 = null;
    }
}
