contract StringsOptDefaults {
    s1: String = "abc";
    s2: String?;
    s3: String = "def";

    init() {
        self.s2 = null;
    }
}