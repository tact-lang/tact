struct MixedDefaults {
    a: Int = 12;
    b: Int? = null;
    c: Bool = false;
    d: Bool? = null;
}

contract MixDefaultsTest {
    m: MixedDefaults;

    init() {
        self.m = MixedDefaults{};
    }
}