contract ManyBoolsAndOptionals {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    i1: Int?;
    b4: Bool;
    i2: Int?;
    b5: Bool;

    init() {
        self.b1=true; self.b2=false; self.b3=true;
        self.i1=null; self.b4=true; self.i2=5; self.b5=false;
    }
}
