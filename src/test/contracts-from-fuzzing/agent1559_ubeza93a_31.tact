struct IntDefaults {
    small: Int as uint4 = 7;
    neg: Int as int8 = -10;
    big: Int as uint256 = 1000000;
}

contract IntDefaultTest {
    val: IntDefaults;

    init() {
        self.val = IntDefaults{};
    }
}