// contract with large list of optional primitive fields
contract LargeOptionalPrimitives {
    a0: Int?;  a1: Int?;  a2: Int?;  a3: Int?;  a4: Int?;
    a5: Int?;  a6: Int?;  a7: Int?;  a8: Int?;  a9: Int?;
    b0: Bool?; b1: Bool?; b2: Bool?; b3: Bool?; b4: Bool?;
    b5: Bool?; b6: Bool?; b7: Bool?; b8: Bool?; b9: Bool?;

    init() {
        self.a0=null; self.a1=1; self.a2=null; self.a3=3; self.a4=null;
        self.a5=5; self.a6=null; self.a7=7; self.a8=null; self.a9=9;
        self.b0=true; self.b1=null; self.b2=false; self.b3=null; self.b4=true;
        self.b5=null; self.b6=false; self.b7=null; self.b8=true; self.b9=null;
    }
}
