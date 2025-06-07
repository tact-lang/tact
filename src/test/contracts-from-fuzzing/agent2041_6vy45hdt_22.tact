contract OptionalString {
    s1: String? = null;
    s2: String? = null;
    s3: String? = null;
    init() {
        self.s1 = null;
        self.s2 = "hello";
        self.s3 = null;
    }
}