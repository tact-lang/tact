struct ManyBoolDefaults {
    a: Bool = false;
    b: Bool = true;
    c: Bool = false;
    d: Bool = true;
    e: Bool = false;
}

contract BoolDefaultsTest {
    vals: ManyBoolDefaults;
    init() {
        self.vals = ManyBoolDefaults{};
    }
}