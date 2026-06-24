contract OptionDefaultMix {
    f1: Int?;
    f2: Bool? = null;
    f3: String? = "test";

    init() {
        self.f1 = 5;
        self.f2 = true;
        self.f3 = "changed";
    }
}