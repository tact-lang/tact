contract LargeBoolAndOptionalMix {
    b1: Bool;
    b2: Bool?;
    b3: Bool;
    b4: Bool?;
    b5: Bool;
    b6: Bool?;
    b7: Bool;
    b8: Bool?;
    b9: Bool;
    b10: Bool?;

    init() {
        self.b1=true; self.b2=null; self.b3=false; self.b4=null; self.b5=true;
        self.b6=null; self.b7=false; self.b8=null; self.b9=true; self.b10=null;
    }
}