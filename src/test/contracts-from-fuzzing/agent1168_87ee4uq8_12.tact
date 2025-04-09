contract OptionalBools {
    flag1: Bool?;
    flag2: Bool?;

    init() {
        self.flag1 = null;
        self.flag2 = true;
    }
}