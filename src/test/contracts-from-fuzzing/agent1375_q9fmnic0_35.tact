struct HasDefaults {
    a: Int = 100;
    b: Bool = false;
}

struct WrapOptWithDefaults {
    inner: HasDefaults?;
}

contract OptionalDefaultsSet {
    s: WrapOptWithDefaults;

    init() {
        self.s = WrapOptWithDefaults{ inner: HasDefaults{} };
    }
}