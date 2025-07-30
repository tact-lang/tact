contract BoolEdge {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool = true;
    flag4: Bool = false;

    init() {
        self.flag1 = true;
        self.flag2 = false;
        self.flag3 = false;
        self.flag4 = true;
    }
}