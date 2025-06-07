struct SWithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
}

contract DefaultsTest {
    d: SWithDefaults;

    init() {
        self.d = SWithDefaults{};
    }
}