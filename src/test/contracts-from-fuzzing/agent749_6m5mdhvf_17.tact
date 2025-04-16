contract MultipleStrings {
    s1: String = "one";
    s2: String = "two";
    s3: String = "three";
    s4: String = "four";
    s5: String? = null;
    s6: String? = null;

    init() {
        self.s1 = "ONE";
        self.s2 = "TWO";
        self.s3 = "THREE";
        self.s4 = "FOUR";
        self.s5 = null;
        self.s6 = "SIX";
    }
}