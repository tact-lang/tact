contract BoolIntOptMix {
    b1: Bool;
    b2: Bool?;
    i1: Int;
    i2: Int?;
    b3: Bool;
    b4: Bool?;
    i3: Int;
    i4: Int?;
    
    init() {
        self.b1=true; self.b2=null; self.i1=1; self.i2=null;
        self.b3=false; self.b4=true; self.i3=7; self.i4=9;
    }
}