contract BoolDefaults {
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool? = null;
    b4: Bool? = true;
    b5: Bool? = false;

    init() {
        self.b1 = false;
        self.b2 = true;
        self.b3 = null;
        self.b4 = null;
        self.b5 = true;
    }
}