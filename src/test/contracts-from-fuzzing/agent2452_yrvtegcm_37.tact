struct HasDefaults {
    a: Int = 1;
    b: Bool = false;
}

contract StructWithDefaults {
    s: HasDefaults = HasDefaults{};
    init() {
        self.s = HasDefaults{};
    }
}