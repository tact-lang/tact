contract StringDefaults {
    s1: String = "abc";
    s2: String = "def";
    s3: String? = null;

    init() {
        self.s1 = "x";
        self.s2 = "y";
        self.s3 = "z";
    }
}