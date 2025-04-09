struct IntDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract DefaultsTest {
    vals: IntDefaults;
    init() {
        self.vals = IntDefaults{};
    }
}