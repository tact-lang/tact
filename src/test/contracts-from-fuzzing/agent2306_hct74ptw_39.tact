struct InnerDefaults {
    a: Int = 2;
}

struct WrapDefaults {
    inner: InnerDefaults = InnerDefaults{};
}

contract DefaultsNested {
    w: WrapDefaults;

    init() {
        self.w = WrapDefaults{};
    }
}
