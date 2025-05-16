struct NestedDefault {
    x: Int = 7;
}

struct WrapDefault {
    inner: NestedDefault = NestedDefault{};
    flag: Bool = true;
}

contract HasNestedDefaults {
    f: WrapDefault;
    init() {
        self.f = WrapDefault{};
    }
}