struct InlineDefaults {
    x: Int = 5;
    y: Bool = false;
    z: String = "hello";
}

contract DefaultsTest {
    val: InlineDefaults;

    init() {
        self.val = InlineDefaults{};
    }
}
