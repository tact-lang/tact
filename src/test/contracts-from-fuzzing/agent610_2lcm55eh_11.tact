contract OnlyBooleans {
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;

    init() {
        self.f1 = true;
        self.f2 = false;
        self.f3 = true;
        self.f4 = false;
    }
}