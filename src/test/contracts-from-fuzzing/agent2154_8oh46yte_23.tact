contract StringDefaults {
    s1: String = "";
    s2: String = "abc";
    s3: String?;

    init() {
        self.s3 = null;
    }
}