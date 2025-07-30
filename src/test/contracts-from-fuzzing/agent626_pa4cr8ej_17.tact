struct TwoDefaults {
    x: Int = 7;
    y: Bool = true;
}

contract OverrideDefaults {
    s: TwoDefaults;

    init() {
        self.s = TwoDefaults{ x: 100, y: false };
    }
}