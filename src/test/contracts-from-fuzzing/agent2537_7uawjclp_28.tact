struct IntDefaults {
    zero: Int = 0;
    minusOne: Int = -1;
    big: Int = 1000000;
}

contract IntDefaultsStore {
    val: IntDefaults;
    init() {
        self.val = IntDefaults{};
    }
}