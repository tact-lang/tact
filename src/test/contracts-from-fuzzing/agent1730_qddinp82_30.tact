struct NestedDefaults {
    val: Int = 7;
}

struct TopWithDefaults {
    inner: NestedDefaults = NestedDefaults{};
    flag: Bool = true;
}

contract TestDefaults {
    s: TopWithDefaults;

    init() {
        self.s = TopWithDefaults{};
    }
}