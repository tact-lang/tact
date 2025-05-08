struct OverrideDefaults {
    a: Int = 5;
    b: Bool = true;
}

contract OverrideInit {
    s: OverrideDefaults;

    init() {
        self.s = OverrideDefaults{ a: 10, b: false };
    }
}