struct HasDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
}

contract DefaultsTest {
    d: HasDefaults;

    init() {
        self.d = HasDefaults{};
    }
}
