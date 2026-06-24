struct OptAndDefaults {
    x: Int?;
    y: Int = 5;
    z: String?;
    w: Bool = false;
}

contract MixDefaultsOpt {
    s: OptAndDefaults;

    init() {
        self.s = OptAndDefaults{
            x: null,
            z: null,
            // defaults apply to y and w
        };
    }
}
