struct MixedDefaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "hello";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract MixedDefaultsTest {
    m: MixedDefaults;

    init() {
        self.m = MixedDefaults{};
    }
}
