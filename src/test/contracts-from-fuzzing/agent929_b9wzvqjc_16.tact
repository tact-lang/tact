struct ZeroDefaults {
    a: Int = 0;
    b: Int = 0;
    c: Int = 0;
}

contract DefaultsTest {
    s: ZeroDefaults;
    init() {
        self.s = ZeroDefaults{};
    }
}