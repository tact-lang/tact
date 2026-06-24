// Contract with very many optional primitive fields
contract LotsOfOptionals {
    i1: Int?; i2: Int?; i3: Int?; i4: Int?; i5: Int?;
    b1: Bool?; b2: Bool?; b3: Bool?; b4: Bool?; b5: Bool?;
    s1: String?; s2: String?; s3: String?; s4: String?; s5: String?;

    init() {
        self.i1=null; self.i2=null; self.i3=null; self.i4=null; self.i5=null;
        self.b1=null; self.b2=null; self.b3=null; self.b4=null; self.b5=null;
        self.s1=null; self.s2=null; self.s3=null; self.s4=null; self.s5=null;
    }
}