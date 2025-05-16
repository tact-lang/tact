struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Bool = true;
    f: Bool = false;
    g: String = "a";
    h: String = "b";
}

contract ManyDefaultsTest {
    data: ManyDefaults;
    init() {
        self.data = ManyDefaults{};
    }
}