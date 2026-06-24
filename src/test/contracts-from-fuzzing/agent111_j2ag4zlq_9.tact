contract OnlyStrings {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;

    init() {
        self.s1 = "";
        self.s2 = null;
        self.s3 = "test";
        self.s4 = null;
    }
}