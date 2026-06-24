struct NestedWithDefaults {
    val: Int = 42;
    text: String = "default";
    flag: Bool = false;
}

contract DefaultsTest {
    s: NestedWithDefaults;

    init() {
        self.s = NestedWithDefaults{};
    }
}
