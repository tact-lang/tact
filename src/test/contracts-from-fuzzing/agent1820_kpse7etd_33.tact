contract ManyOptionalBools {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    init() {
        self.b1 = null;
        self.b2 = true;
        self.b3 = false;
    }
}