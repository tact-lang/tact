contract ManyBoolAndOptionals {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    o1: Int?;
    o2: Int?;
    o3: Int?;
    init() {
        self.b1 = true;
        self.b2 = false;
        self.b3 = true;
        self.o1 = null;
        self.o2 = null;
        self.o3 = null;
    }
}