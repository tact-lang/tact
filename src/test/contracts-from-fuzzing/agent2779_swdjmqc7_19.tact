struct ManyBoolDefaults {
    b1: Bool = false;
    b2: Bool = true;
    b3: Bool = false;
    b4: Bool = true;
}

contract BoolDefaultsContainer {
    data: ManyBoolDefaults;
    init() {
        self.data = ManyBoolDefaults{};
    }
}