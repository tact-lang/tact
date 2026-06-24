struct MixedDefaults {
    i: Int = 42;
    b: Bool;
    s: String = "default";
}

contract MixedDefaultsContract {
    f: MixedDefaults;
    init() {
        self.f = MixedDefaults{
            b: true,
        };
    }
}