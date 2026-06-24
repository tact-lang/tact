struct MixedOptionalAndDefaults {
    a: Int? = null;
    b: Bool = true;
    c: String? = null;
}

contract MixedDefaultsTest {
    data: MixedOptionalAndDefaults;

    init() {
        self.data = MixedOptionalAndDefaults{};
    }

    receive() {
        self.data = MixedOptionalAndDefaults{a: 42, b: false, c: "test"};
    }
}