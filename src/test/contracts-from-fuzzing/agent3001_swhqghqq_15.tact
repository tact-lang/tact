struct NestedDefaults {
    x: Int = 5;
    y: Bool = true;
}

contract DefaultsInStructs {
    v: NestedDefaults;

    init() {
        self.v = NestedDefaults{};
    }
}
