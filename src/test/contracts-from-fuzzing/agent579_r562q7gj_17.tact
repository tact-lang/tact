contract BoolBits {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    o1: Bool?;
    o2: Bool?;
    o3: Bool?;
    o4: Bool?;

    init() {
        self.b1 = true;
        self.b2 = false;
        self.b3 = true;
        self.b4 = false;
        self.o1 = null;
        self.o2 = true;
        self.o3 = null;
        self.o4 = false;
    }
}