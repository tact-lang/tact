struct BoolDefaults {
    flag1: Bool = true;
    flag2: Bool = false;
    optFlag: Bool? = null;
}

contract TestContract {
    bools: BoolDefaults;

    init() {
        self.bools = BoolDefaults{};
    }
}
