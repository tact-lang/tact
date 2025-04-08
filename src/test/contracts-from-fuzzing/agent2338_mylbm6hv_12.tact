contract ManyOptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;

    init() {
        self.s1 = null;
        self.s2 = "hi";
        self.s3 = null;
        self.s4 = "hello";
        self.s5 = null;
    }
}