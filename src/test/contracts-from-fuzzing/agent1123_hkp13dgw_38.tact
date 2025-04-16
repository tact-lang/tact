contract OptionalAndRegular {
    i1: Int;
    i2: Int?;
    b1: Bool;
    b2: Bool?;
    s1: String;
    s2: String?;
    
    init() {
        self.i1 = 5;
        self.i2 = null;
        self.b1 = true;
        self.b2 = null;
        self.s1 = "abc";
        self.s2 = null;
    }
}