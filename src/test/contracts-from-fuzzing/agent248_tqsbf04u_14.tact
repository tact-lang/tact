contract ManyBools {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    b6: Bool = false;
    b7: Bool = true;
    b8: Bool;
    b9: Bool = true;
    b10: Bool;

    init() {
        self.b1 = true;
        self.b2 = false;
        self.b3 = true;
        self.b4 = false;
        self.b5 = true;
        self.b8 = true;
        self.b10 = false;
    }
}