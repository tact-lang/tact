contract ManyStrings {
    s1: String;
    s2: String;
    s3: String?;
    s4: String?;

    init() {
        self.s1 = "a";
        self.s2 = "b";
        self.s3 = null;
        self.s4 = null;
    }
}