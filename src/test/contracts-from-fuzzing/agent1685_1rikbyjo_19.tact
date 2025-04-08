struct IntDefaults {
    a: Int = 7;
    b: Int = 8;
}

contract Defaults {
    val: IntDefaults;

    init() {
        self.val = IntDefaults{};
    }
}
