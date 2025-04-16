contract BoolDefaultContract {
    flag1: Bool = false;
    flag2: Bool = true;

    init() {
        self.flag1 = true;
        self.flag2 = false;
    }
}