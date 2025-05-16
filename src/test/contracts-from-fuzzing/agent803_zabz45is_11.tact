contract OnlyDefaults {
    v1: Int = 1;
    v2: Bool = true;
    v3: String = "str";

    init() {
        self.v1 = 42;
        self.v2 = false;
        self.v3 = "changed";
    }
}