struct MixedDefaults {
    a: Int?;
    b: String = "";
    c: Bool = false;
}

contract MixedDefaultsTest {
    s: MixedDefaults;
    init() {
        self.s = MixedDefaults{
            a:null
        };
    }
}