struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Int = 6;
}

contract ManyDefaultsTest {
    s: ManyDefaults = ManyDefaults{};

    init() {
        self.s = ManyDefaults{ a:7, b:8, c:9, d:10, e:11, f:12 };
    }
}