contract StringsWithDefaults {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";

    init() {
        self.s1 = "x";
        self.s2 = "y";
        self.s3 = "z";
    }
}