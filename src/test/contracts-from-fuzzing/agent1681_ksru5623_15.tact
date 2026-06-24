contract OptionalAndDefault {
    i1: Int = 5;
    i2: Int?;
    b1: Bool = false;
    b2: Bool?;
    s1: String = "abc";
    s2: String?;
    
    init() {
        self.i2 = null;
        self.b2 = null;
        self.s2 = null;
    }
}