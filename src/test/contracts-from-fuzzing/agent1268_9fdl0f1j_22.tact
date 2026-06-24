// Contract with many bools, optional bools
contract ManyBools {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool?;
    b6: Bool?;
    b7: Bool?;
    b8: Bool?;

    init() {
        self.b1 = true;
        self.b2 = false;
        self.b3 = true;
        self.b4 = false;
        self.b5 = null;
        self.b6 = true;
        self.b7 = null;
        self.b8 = false;
    }
}