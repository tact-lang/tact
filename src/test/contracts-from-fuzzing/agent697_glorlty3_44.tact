contract StringOptionalMix {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;

    init() {
        self.s1 = "a";
        self.s2 = null;
        self.s3 = "b";
        self.s4 = null;
    }
}