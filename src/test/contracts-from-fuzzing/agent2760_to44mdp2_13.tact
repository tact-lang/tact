struct OptionsAndDefaults {
    s: String = "default";
    n: Int?;
    b: Bool = false;
}

contract MixDefault {
    d: OptionsAndDefaults;

    init() {
        self.d = OptionsAndDefaults{
            s: "init",
            n: 99,
            b: true
        };
    }
}