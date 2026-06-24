contract BoolOptionMix {
    f1: Bool;
    f2: Bool?;
    f3: Bool;
    f4: Bool?;
    f5: Bool;
    f6: Bool?;

    init() {
        self.f1 = true;
        self.f2 = null;
        self.f3 = false;
        self.f4 = true;
        self.f5 = false;
        self.f6 = null;
    }
}