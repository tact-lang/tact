struct MixedDefaults {
    a: Int;
    b: Int = 42;
    c: String;
    d: String = "hi";
}

contract MixedDefaultsInit {
    s: MixedDefaults;
    init() {
        self.s = MixedDefaults{
            a: 1,
            c: "world"
        };
    }
}