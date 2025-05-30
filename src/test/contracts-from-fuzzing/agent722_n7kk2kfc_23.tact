struct WithBoolDefaults {
    a: Bool = true;
    b: Bool = false;
}

contract BoolDefaults {
    data: WithBoolDefaults;

    init() {
        self.data = WithBoolDefaults{};
    }
}