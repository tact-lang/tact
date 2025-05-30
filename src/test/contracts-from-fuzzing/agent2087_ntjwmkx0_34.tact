struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
}

contract StructWithBoolDefaultsInit {
    f: BoolDefaults;

    init() {
        self.f = BoolDefaults{};
    }
}