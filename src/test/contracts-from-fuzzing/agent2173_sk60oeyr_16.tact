struct IntDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract DefaultsTest {
    x: IntDefaults;
    init() {
        self.x = IntDefaults{};
    }
}