contract MultipleOptionalScalars {
    i1: Int?;
    i2: Int?;
    b1: Bool?;
    b2: Bool?;
    s1: String?;
    s2: String?;
    a1: Address?;

    init() {
        self.i1=null; self.i2=1;
        self.b1=true; self.b2=null;
        self.s1="x"; self.s2=null;
        self.a1=null;
    }
}