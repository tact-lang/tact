contract BoolMix {
    f1: Bool;
    f2: Bool?;
    f3: Int;
    f4: String;

    init() {
        self.f1 = true;
        self.f2 = null;
        self.f3 = 42;
        self.f4 = "test";
    }
}
