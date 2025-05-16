struct NullDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NullDefaultsTest {
    data: NullDefaults;

    init() {
        self.data = NullDefaults{ a: null, b: null, c: null };
    }
}