struct InlineDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    d: Int?; // implicit null default
}

contract InlineDefaultsTest {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{};
    }
}