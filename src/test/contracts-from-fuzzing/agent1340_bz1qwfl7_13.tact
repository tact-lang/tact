contract DefaultsAndOverrides {
    v1: Int = 42;
    v2: Bool = false;
    v3: String = "magic";
    v4: Int?;
    v5: Bool? = true;

    init() {
        self.v1 = 1;
        self.v2 = true;
        self.v3 = "changed";
        self.v4 = null;
        self.v5 = null;
    }
}