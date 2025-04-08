struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
}

contract DefaultsTest {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{};
    }
}