contract StringsVsBools {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool = true;

    init() {
        self.s1 = "x";
        self.s2 = "y";
        self.s3 = "z";
        self.b1 = false;
        self.b2 = true;
        self.b3 = false;
    }
}
