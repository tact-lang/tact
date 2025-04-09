contract ManyNullableStrings {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;

    init() {
        self.s1 = null;
        self.s2 = "AB";
        self.s3 = null;
        self.s4 = "CD";
        self.s5 = null;
    }
}
