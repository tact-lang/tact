contract OptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;

    init() {
        self.s1 = null;
        self.s2 = "foo";
        self.s3 = null;
    }
}
