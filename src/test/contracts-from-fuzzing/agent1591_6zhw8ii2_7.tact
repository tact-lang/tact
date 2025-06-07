contract LongBoolSequence {
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
    b11: Bool;
    b12: Bool;
    b13: Bool;
    b14: Bool;
    b15: Bool;
    b16: Bool;
    b17: Bool;
    b18: Bool;
    b19: Bool;
    b20: Bool;

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
        self.b11 = true;
        self.b12 = false;
        self.b13 = true;
        self.b14 = false;
        self.b15 = true;
        self.b16 = false;
        self.b17 = true;
        self.b18 = false;
        self.b19 = true;
        self.b20 = false;
    }

    receive() {
        self.b1 = !self.b1;
    }
}