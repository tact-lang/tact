contract DefaultStrings {
    s1: String = "";
    s2: String = "abc";
    s3: String? = null;
    s4: String? = "hi";

    init() {
        self.s1 = "x";
        self.s2 = "y";
        self.s3 = null;
        self.s4 = "z";
    }
}