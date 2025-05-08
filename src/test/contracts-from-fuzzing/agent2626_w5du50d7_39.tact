contract DifferentStrings {
    s1: String = "first string";
    s2: String?;
    s3: String = "";

    init() {
        self.s2 = null;
    }
}