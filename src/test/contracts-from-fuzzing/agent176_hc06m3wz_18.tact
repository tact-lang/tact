contract BoolFields {
    flag1: Bool = true;
    flag2: Bool = false;
    flag3: Bool = true;
    flag4: Bool = false;

    init() {
        self.flag3 = false;
        self.flag4 = true;
    }
}