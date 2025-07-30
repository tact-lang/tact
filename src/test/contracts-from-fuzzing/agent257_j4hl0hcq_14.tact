contract BoolVariants {
    b1: Bool;
    b2: Bool?;
    b3: Bool = true;
    b4: Bool?;
    b5: Bool?;
    init() {
        self.b1 = false;
        self.b2 = null;
        self.b4 = true;
        self.b5 = null;
    }
}