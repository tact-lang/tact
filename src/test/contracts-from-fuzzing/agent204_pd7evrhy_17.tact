contract ManyBoolBytes {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    b6: Bool;
    b7: Bool;
    b8: Bool;
    b9: Bool;
    b10: Bool;
    small1: Int as uint4;
    small2: Int as uint4;

    init() {
        self.b1=true; self.b2=false; self.b3=true; self.b4=false; self.b5=true;
        self.b6=false; self.b7=true; self.b8=false; self.b9=true; self.b10=false;
        self.small1=5; self.small2=12;
    }

    receive() {
        self.b1 = !self.b1;
        self.b10 = !self.b10;
        self.small1 = (self.small1 + 1) % 16;
    }
}