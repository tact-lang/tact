struct HasLongDefaults {
    a: Int = 1;
    b: String = "foo";
    c: Bool = true;
    d: Int? = null;
    e: String? = null;
    f: Bool? = null;
}

contract LongDefaultsTest {
    x: HasLongDefaults;

    init() {
        self.x = HasLongDefaults{};
    }
}