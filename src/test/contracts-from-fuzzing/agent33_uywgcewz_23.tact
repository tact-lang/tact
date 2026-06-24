contract ManyBoolsWithOptional {
    b1: Bool;
    b2: Bool;
    b3: Bool?;
    b4: Bool;
    b5: Bool?;
    b6: Bool;
    b7: Bool?;

    init() {
        self.b1=true; self.b2=false; self.b3=null;
        self.b4=true; self.b5=false; self.b6=false; self.b7=null;
    }
}