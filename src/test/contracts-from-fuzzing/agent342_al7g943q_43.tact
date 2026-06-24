struct StructWithBoolDefaults {
    a: Bool = false;
    b: Bool = true;
}

contract BoolDefaultFields {
    f: StructWithBoolDefaults;

    init() {
        self.f = StructWithBoolDefaults{};
    }
}
