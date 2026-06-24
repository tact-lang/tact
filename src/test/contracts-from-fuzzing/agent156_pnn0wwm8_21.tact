contract ManyBoolsOptionalInt {
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;
    f5: Bool;
    opt: Int?;

    init() {
        self.f1 = true;
        self.f2 = false;
        self.f3 = true;
        self.f4 = false;
        self.f5 = true;
        self.opt = 100;
    }
}
