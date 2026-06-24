struct DefaultsNested {
    m: Int = 1;
}

struct DefaultsOuter {
    inner: DefaultsNested = DefaultsNested{};
    flag: Bool = false;
}

contract NestedDefaults {
    data: DefaultsOuter;

    init() {
        self.data = DefaultsOuter{};
    }
}
