contract BoolsAndOptions {
    b1: Bool;
    b2: Bool = true;
    b3: Bool?;
    b4: Bool? = false;
    b5: Bool?; // left to null by default

    init() {
        self.b1 = false;
        self.b3 = true;
        self.b4 = null;
        self.b5 = true;
    }
}