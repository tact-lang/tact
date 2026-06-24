struct NestedDefaults {
    x: Int = 1;
    y: Bool = false;
}

contract ComplexDefaults {
    nested: NestedDefaults;
    flag: Bool?;

    init() {
        self.nested = NestedDefaults{};
        self.flag = null;
    }
}
