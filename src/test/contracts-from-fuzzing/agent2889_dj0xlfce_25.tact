contract MultipleNullableStrings {
    s1: String?;
    s2: String?;
    s3: String?;

    init() {
        self.s1 = null;
        self.s2 = "aaa";
        self.s3 = null;
    }
}