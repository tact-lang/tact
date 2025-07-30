struct IntDefaults {
    a: Int = 7;
    b: Int = 0;
    c: Int = -3;
}

contract IntDefaultsContract {
    f: IntDefaults;

    init() {
        self.f = IntDefaults{};
    }
}