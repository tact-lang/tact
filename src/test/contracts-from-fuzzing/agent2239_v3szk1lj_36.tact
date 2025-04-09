contract StringAndBoolLayout {
    s1: String?;
    b1: Bool;
    s2: String;
    b2: Bool?;

    init() {
        self.s1 = null;
        self.b1 = true;
        self.s2 = "hi";
        self.b2 = null;
    }
}