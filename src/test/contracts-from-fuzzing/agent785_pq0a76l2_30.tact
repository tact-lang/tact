// Contract with dozens of optional fields
contract BulkOptionals {
    a1: Int?; a2: Int?; a3: Int?; a4: Int?; a5: Int?;
    b1: Bool?; b2: Bool?; b3: Bool?; b4: Bool?; b5: Bool?;
    s1: String?; s2: String?; s3: String?; s4: String?; s5: String?;

    init() {
        self.a1 = null; self.a2 = 2; self.a3 = null; self.a4 = 4; self.a5 = null;
        self.b1 = true; self.b2 = null; self.b3 = false; self.b4 = null; self.b5 = true;
        self.s1 = "hi"; self.s2 = null; self.s3 = "there"; self.s4 = null; self.s5 = "!";
    }
}
