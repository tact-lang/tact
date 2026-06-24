struct NestedDefaults {
    a: Int = 5;
    b: Bool = true;
}

contract DefaultsTest {
    s: NestedDefaults;

    init() {
        self.s = NestedDefaults{};
    }
}