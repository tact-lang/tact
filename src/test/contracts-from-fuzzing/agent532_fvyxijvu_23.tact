struct DefaultsAndOverride {
    a: Int = 11;
    b: Bool = false;
}

contract OverrideDefault {
    s: DefaultsAndOverride;

    init() {
        self.s = DefaultsAndOverride{ a: 42, b: true };
    }
}