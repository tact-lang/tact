contract StringsAndBools {
    s1: String = "a";
    s2: String = "b";
    b1: Bool = true;
    b2: Bool = false;

    init() {
        self.s1 = "x";
        self.s2 = "y";
        self.b1 = false;
        self.b2 = true;
    }
}
