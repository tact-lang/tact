struct LongDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract ManyDefaultsTest {
    data: LongDefaults;

    init() {
        self.data = LongDefaults{};
    }
}