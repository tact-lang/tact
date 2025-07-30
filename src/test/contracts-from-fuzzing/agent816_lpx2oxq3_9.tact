contract BoolFields {
    flag1: Bool;
    flag2: Bool?;
    flag3: Bool;

    init() {
        self.flag1 = true;
        self.flag2 = null;
        self.flag3 = false;
    }
}
