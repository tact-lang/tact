contract StringsAndBools {
    s1: String;
    s2: String?;
    b1: Bool;
    b2: Bool?;

    init() {
        self.s1 = "foo";
        self.s2 = null;
        self.b1 = true;
        self.b2 = false;
    }
}