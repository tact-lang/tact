struct IntDefaults {
    val1: Int = 1;
    val2: Int = 2;
    val3: Int = 3;
    val4: Int = 4;
}

contract IntDefaultsContract {
    data: IntDefaults;

    init() {
        self.data = IntDefaults{};
    }
}