struct DefaultsNested {
    v1: Int = 10;
    v2: Bool = false;
}

contract StructWithDefaults {
    s: DefaultsNested;

    init() {
        self.s = DefaultsNested{};
    }
}