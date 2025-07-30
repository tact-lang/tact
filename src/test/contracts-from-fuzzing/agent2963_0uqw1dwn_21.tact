contract OptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;

    init() {
        self.s1 = "a";
        self.s2 = null;
        self.s3 = "c";
    }
}
