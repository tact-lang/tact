contract OptionalStringDefaults {
    s1: String? = null;
    s2: String? = "abc";
    s3: String?;
    s4: String?;

    init() {
        self.s1 = null;
        self.s2 = "def";
        self.s3 = null;
        self.s4 = "ghi";
    }
}