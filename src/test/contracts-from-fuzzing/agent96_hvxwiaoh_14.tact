contract BoolBlast {
    flag1: Bool = false;
    flag2: Bool;
    flag3: Bool?;
    flag4: Bool? = null;
    flag5: Bool = true;
    flag6: Bool?;

    init() {
        self.flag2 = true;
        self.flag3 = false;
        self.flag4 = true;
        self.flag6 = null;
    }

    receive() {}
}