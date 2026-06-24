struct NestedDefaults {
    innerVal: Int = 42;
}

struct MidDefaults {
    nested: NestedDefaults = NestedDefaults{};
}

contract DefaultsInNested {
    state: MidDefaults;

    init() {
        self.state = MidDefaults{};
    }
}