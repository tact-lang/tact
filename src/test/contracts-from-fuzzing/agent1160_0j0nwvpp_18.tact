contract OptionalStrings {
    s1: String? = null;
    s2: String? = null;
    s3: String? = null;

    init() {
        self.s1 = "x";
        self.s2 = null;
        self.s3 = "z";
    }
}