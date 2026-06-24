contract InitializeBoolChain {
    flag1: Bool;
    flag2: Bool = false;
    flag3: Bool;

    init() {
        self.flag1 = true;
        self.flag3 = false;
    }
}
