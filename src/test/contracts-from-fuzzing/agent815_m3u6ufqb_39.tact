struct NestedBoolDefaults {
    b1: Bool = false;
    b2: Bool = true;
    b3: Bool = false;
}

contract NestedBoolDefaultsStore {
    data: NestedBoolDefaults;

    init() {
        self.data = NestedBoolDefaults{};
    }
}