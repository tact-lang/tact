struct ManyBoolDefaults {
    b0: Bool = false;
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool = true;
    b4: Bool = false;
}

contract BoolDefaults {
    f: ManyBoolDefaults;
    init() {
        self.f = ManyBoolDefaults{};
    }
}