struct NestedWithDefaults {
    i: Int = 5;
    s: String = "test";
    b: Bool = true;
}

contract DefaultsTest {
    f: NestedWithDefaults;

    init() {
        self.f = NestedWithDefaults{};
    }
}
