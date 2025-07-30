contract HasManyOptionalBools {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    b4: Bool?;
    b5: Bool?;
    b6: Bool?;
    b7: Bool?;

    init() {
        self.b1 = true;
        self.b2 = null;
        self.b3 = false;
        self.b4 = null;
        self.b5 = true;
        self.b6 = null;
        self.b7 = false;
    }

    receive() {
        self.b1 = self.b1;
    }
}