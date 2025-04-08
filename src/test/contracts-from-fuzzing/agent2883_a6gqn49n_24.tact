contract AllStrings {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;

    init() {
        self.s1 = "abc";
        self.s2 = null;
        self.s3 = "xyz";
        self.s4 = null;
    }
}