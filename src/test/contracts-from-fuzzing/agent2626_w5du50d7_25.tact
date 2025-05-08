contract ManyStrings {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    s4: String = "d";
    s5: String = "e";

    init() {
        self.s1 = "aa";
        self.s2 = "bb";
        self.s3 = "cc";
        self.s4 = "dd";
        self.s5 = "ee";
    }
}