struct IntDefaults {
    a: Int = 0;
    b: Int = -1;
    c: Int = 1000000;
}

contract IntDefaultsTest {
    val: IntDefaults;

    init() {
        self.val = IntDefaults{};
    }
}
