struct WithBoolDefaults {
    flag1: Bool = true;
    flag2: Bool = false;
}

contract BoolDefaults {
    data: WithBoolDefaults;

    init() {
        self.data = WithBoolDefaults{};
    }
}