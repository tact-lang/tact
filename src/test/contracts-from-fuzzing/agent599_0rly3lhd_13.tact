contract TestContract {
    flag1: Bool = true;
    flag2: Bool = false;
    flag3: Bool; // no default, requires init

    init() {
        self.flag3 = true;
    }
}