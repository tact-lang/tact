struct NullsAndDefaults {
    a: Int?;
    b: Bool?;
    c: Int = 42;
    d: Bool = false;
}

contract NullsAndDefaultsTest {
    s: NullsAndDefaults;

    init() {
        self.s = NullsAndDefaults{
            a: null,
            b: null
        };
    }
}