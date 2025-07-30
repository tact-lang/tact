struct StructWithBoolDefaults {
    f1: Bool = false;
    f2: Bool = true;
    f3: Bool? = null;
    f4: Bool? = true;
}

contract BoolDefaultsStructContract {
    data: StructWithBoolDefaults;

    init() {
        self.data = StructWithBoolDefaults{};
    }
}