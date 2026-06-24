struct IntDefaults {
    a: Int = -1;
    b: Int = 0;
    c: Int = 123456789;
}

contract IntDefTest {
    vals: IntDefaults;
    init() {
        self.vals = IntDefaults{};
    }
}
