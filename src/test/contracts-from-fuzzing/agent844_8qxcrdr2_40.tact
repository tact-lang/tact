contract DozensOfFields {
    a1: Int?; a2: Int?; a3: Int?; a4: Int?; a5: Int?; a6: Int?; a7: Int?; a8: Int?; a9: Int?; a10: Int?;
    b1: Bool?; b2: Bool?; b3: Bool?; b4: Bool?; b5: Bool?; b6: Bool?; b7: Bool?; b8: Bool?; b9: Bool?; b10: Bool?;
    s1: String?; s2: String?; s3: String?; s4: String?; s5: String?; s6: String?; s7: String?; s8: String?; s9: String?; s10: String?;

    init() {
        self.a1 = null; self.a2=null; self.a3=null; self.a4=null; self.a5=null; self.a6=null; self.a7=null; self.a8=null; self.a9=null; self.a10=null;
        self.b1 = null; self.b2=null; self.b3=null; self.b4=null; self.b5=null; self.b6=null; self.b7=null; self.b8=null; self.b9=null; self.b10=null;
        self.s1 = null; self.s2=null; self.s3=null; self.s4=null; self.s5=null; self.s6=null; self.s7=null; self.s8=null; self.s9=null; self.s10=null;
    }

    receive() {
        let _=self.a1;
    }
}