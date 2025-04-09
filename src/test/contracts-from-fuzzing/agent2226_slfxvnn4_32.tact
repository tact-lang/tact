contract BoolVariants {
    b1: Bool = false;
    b2: Bool = true;
    b3: Bool;
    init() {
        self.b1 = true;
        self.b2 = false;
        self.b3 = true;
    }
}