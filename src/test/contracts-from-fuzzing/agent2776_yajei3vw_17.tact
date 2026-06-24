struct InlineDefaults {
    x: Int = 12;
    y: Bool = true;
    z: String = "abc";
}

contract DefaultsTest {
    d: InlineDefaults;

    init() {
        self.d = InlineDefaults{};
    }
}
