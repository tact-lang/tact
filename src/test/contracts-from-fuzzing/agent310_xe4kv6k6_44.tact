contract ManyBoolOptionals {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    b4: Bool?;

    init() {
        self.b1 = null;
        self.b2 = true;
        self.b3 = null;
        self.b4 = false;
    }
}