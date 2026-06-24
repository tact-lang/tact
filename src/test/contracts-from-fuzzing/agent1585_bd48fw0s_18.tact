struct NestedDefaults {
    n: Int = 42;
    s: String = "hello";
    b: Bool = true;
}

contract DefaultsTest {
    f: NestedDefaults;

    init() {
        self.f = NestedDefaults{};
    }
}