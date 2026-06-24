struct LargeDefaults {
    a: Int = 1; b: Int = 2; c: Bool = false; d: Bool = true;
    s: String = "str";
}

contract LargeDefaultsTest {
    d: LargeDefaults;
    init() {
        self.d = LargeDefaults{};
    }
}