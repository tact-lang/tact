struct IntDefaults {
    a: Int = 5;
    b: Int = 10;
}

contract IntDefaultsTest {
    data: IntDefaults;

    init() {
        self.data = IntDefaults{};
    }
}