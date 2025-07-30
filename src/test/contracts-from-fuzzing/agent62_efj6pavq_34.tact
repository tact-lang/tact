struct ManyDefaults {
    a: Int = 7;
    b: String = "foo";
    c: Bool = true;
}

contract ManyDefaultsContract {
    s: ManyDefaults;

    init() {
        self.s = ManyDefaults{};
    }
}