contract EmptyStrings {
    s1: String = "";
    s2: String = "";
    s3: String = "initial";

    init() {
        self.s1 = "abc";
        self.s2 = "def";
        self.s3 = "";
    }
}