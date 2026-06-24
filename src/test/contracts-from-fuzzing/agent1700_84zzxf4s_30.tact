contract BoolDefaults {
    flag1: Bool;
    flag2: Bool = false;
    flag3: Bool = true;

    init() {
        self.flag1 = true;
        self.flag2 = true;
        self.flag3 = false;
    }
}
