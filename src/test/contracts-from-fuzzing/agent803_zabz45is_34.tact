contract BoolDefaultsContract {
    b1: Bool = false;
    b2: Bool = true;
    b3: Bool = false;

    init() {
        self.b1 = true;
        self.b2 = false;
        self.b3 = true;
    }
}