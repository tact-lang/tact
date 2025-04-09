contract BoolDefaults {
    flag1: Bool = true;
    flag2: Bool = false;
    flag3: Bool = true;
    flag4: Bool = false;

    init() {
        self.flag1 = false;
        self.flag2 = true;
        self.flag3 = false;
        self.flag4 = true;
    }
}