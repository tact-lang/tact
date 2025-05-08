struct HasDefaults {
    a: Int = 1;
    b: Bool = true;
    c: Int?;
    d: Bool?;
}

contract DefaultsTest {
    s: HasDefaults;

    init() {
        self.s = HasDefaults{ c: null, d: false };
    }
}
