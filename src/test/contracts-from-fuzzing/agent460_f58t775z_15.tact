contract MultiString {
    s1: String = "abc";
    s2: String = "def";
    s3: String?;
    s4: String?;
    init() {
        self.s1 = "ABC";
        self.s2 = "DEF";
        self.s3 = "123";
        self.s4 = null;
    }
}
