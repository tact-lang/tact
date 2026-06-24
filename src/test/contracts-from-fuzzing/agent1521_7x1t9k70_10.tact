contract ManySmallVars {
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

    i1: Int as uint8;
    i2: Int as uint8;
    i3: Int as uint8;
    i4: Int as uint8;
    i5: Int as uint8;

    init() {
        self.b1 = true;
        self.b2 = false;
        self.b3 = true;
        self.b4 = false;
        self.b5 = true;
        self.b6 = false;
        self.b7 = true;
        self.b8 = false;
        self.b9 = true;
        self.b10 = false;

        self.i1 = 1;
        self.i2 = 2;
        self.i3 = 3;
        self.i4 = 4;
        self.i5 = 5;
    }
}