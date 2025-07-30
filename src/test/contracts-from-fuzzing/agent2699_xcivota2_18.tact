contract OptionalStringDefaults {
    s1: String? = null;
    s2: String? = "Hello";
    s3: String?;

    init() {
        self.s1 = "X";
        self.s2 = null;
        self.s3 = "Y";
    }
}