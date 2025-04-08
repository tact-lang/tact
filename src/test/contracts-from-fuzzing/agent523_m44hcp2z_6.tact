struct NestedDefaults {
    count: Int = 5;
    flag: Bool = true;
    text: String = "hello";
}

contract DefaultsTest {
    field: NestedDefaults;

    init() {
        self.field = NestedDefaults{};
    }
}
