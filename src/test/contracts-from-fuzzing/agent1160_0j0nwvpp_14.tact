contract JustBools {
    flag1: Bool = true;
    flag2: Bool = false;
    flag3: Bool = true;

    init() {
        self.flag1 = false;
        self.flag2 = true;
        self.flag3 = false;
    }
}