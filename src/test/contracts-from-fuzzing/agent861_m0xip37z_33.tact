contract MixOptionalandBool {
    f1: Int?;
    f2: Bool;
    f3: Int;
    f4: Bool?;

    init() {
        self.f1 = null;
        self.f2 = true;
        self.f3 = 42;
        self.f4 = null;
    }
}
