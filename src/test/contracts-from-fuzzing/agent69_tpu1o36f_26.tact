struct MixedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String;
    d: Int?;
}

contract MixedDefaultsTest {
    md: MixedDefaults;

    init() {
        self.md = MixedDefaults{
            c: "X",
            d: null
        };
    }
}