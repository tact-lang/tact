struct MixDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "foo";
    d: Int?;
    e: Bool? = null;
}

contract MixedDefaultsTest {
    s: MixDefaults;
    init() {
        self.s = MixDefaults{
            b: true, d: null,
        };
    }
}
