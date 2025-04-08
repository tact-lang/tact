struct HasBoolDefaults {
    a: Bool = true;
    b: Bool = false;
}

contract BoolDefaults {
    f: HasBoolDefaults;

    init() {
        self.f = HasBoolDefaults{};
    }
}