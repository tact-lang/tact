contract BoolFields {
    flag1: Bool = true;
    flag2: Bool = false;

    init() {
        self.flag1 = false;
        self.flag2 = true;
    }
}