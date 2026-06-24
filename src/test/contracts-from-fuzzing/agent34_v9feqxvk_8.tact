struct NestedDefaults {
    x: Int = 1;
    y: Bool = false;
    z: String = "hello";
}

contract DefaultsTest {
    s: NestedDefaults;

    init() {
        self.s = NestedDefaults{};
    }
}