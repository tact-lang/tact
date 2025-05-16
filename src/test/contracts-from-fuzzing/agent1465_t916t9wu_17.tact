struct SDefaults {
    a: Int = 1;
    b: Bool = true;
}

contract PartialOverride {
    s: SDefaults;

    init() {
        self.s = SDefaults{
            b: false
        };
    }
}