struct IntDefaults {
    a: Int = 0;
    b: Int = 1;
    c: Int = -1;
}

contract IntDefaultsStorage {
    data: IntDefaults;

    init() {
        self.data = IntDefaults{};
    }
}