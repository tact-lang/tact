struct HasBoolDefaults {
    flag1: Bool = true;
    flag2: Bool = false;
}

contract DefaultBoolHolder {
    s: HasBoolDefaults;

    init() {
        self.s = HasBoolDefaults{};
    }
}