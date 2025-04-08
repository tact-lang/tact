contract EmptyStringDefaults {
    s1: String = "";
    s2: String = "";
    s3: String = "hello";
    init() {
        self.s1 = "new";
        self.s2 = "also new";
        self.s3 = "again";
    }
}