contract OptionalBoolDefaults {
    b1: Bool? = null;
    b2: Bool? = true;
    b3: Bool? = false;

    init() {
        self.b1 = false;
        self.b2 = null;
        self.b3 = true;
    }

    receive() {
        let _ = self.b1;
        let _ = self.b2;
        let _ = self.b3;
    }
}