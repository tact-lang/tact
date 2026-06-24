struct HasMixedDefaults {
    a: Int = 12;
    b: Bool = false;
    c: String;
    d: String? = null;
}
contract MixedDefaultsTest {
    s: HasMixedDefaults;
    init() {
        self.s = HasMixedDefaults{
            c: "str"
        };
    }
}