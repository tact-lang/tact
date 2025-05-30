contract StringOptionalMix {
    s1: String? = null;
    s2: String? = "a";
    s3: String? = null;
    s4: String? = "b";

    init() {
        self.s1 = "hello";
        self.s2 = null;
        self.s3 = "world";
        self.s4 = null;
    }
}