contract ManyOptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;

    init() {
        self.s1 = null;
        self.s2 = "a";
        self.s3 = null;
        self.s4 = "b";
    }
}