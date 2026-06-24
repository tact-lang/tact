contract StringDefaultOptional {
    s1: String = "default";
    s2: String?;

    init() {
        self.s2 = null;
    }
}