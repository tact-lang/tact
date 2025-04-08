struct HasDefaults {
    a: Int = 7;
    b: Bool = true;
    c: String = "abc";
}

contract DefaultsTest {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}