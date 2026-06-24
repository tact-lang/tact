contract BoolFlags {
    flag1: Bool = true;
    flag2: Bool = false;
    flag3: Bool = true;
    flag4: Bool = false;
    flag5: Bool = true;

    init() {
        self.flag2 = true;
    }

    receive() {
        self.flag5 = !self.flag5;
    }
}