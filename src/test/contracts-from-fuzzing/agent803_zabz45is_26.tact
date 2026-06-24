struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
    d: Int = 5;
    e: Bool = false;
    f: String = "y";
}

contract ManyDefaultsTest {
    d: ManyDefaults;
    init() {
        self.d = ManyDefaults{};
    }
}