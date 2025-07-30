contract OptionalBoolDefaults {
    flag1: Bool? = null;
    flag2: Bool? = true;
    flag3: Bool? = false;
    flag4: Bool?;

    init() {
        self.flag1 = null;
        self.flag2 = false;
        self.flag3 = true;
        self.flag4 = null;
    }
}