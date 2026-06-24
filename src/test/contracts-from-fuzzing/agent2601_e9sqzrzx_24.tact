contract ManyBoolInt {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    i1: Int;
    i2: Int as uint32;
    i3: Int as uint8;
    b4: Bool;
    b5: Bool;

    init() {
        self.b1 = false;
        self.b2 = true;
        self.b3 = false;
        self.i1 = 123;
        self.i2 = 9999;
        self.i3 = 12;
        self.b4 = true;
        self.b5 = false;
    }
}