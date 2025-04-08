struct HasNullDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NullDefaultsTest {
    vals: HasNullDefaults;

    init() {
        self.vals = HasNullDefaults{};
    }
}
