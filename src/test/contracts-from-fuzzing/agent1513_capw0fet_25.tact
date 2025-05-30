struct IntDefaults {
    a: Int = 55;
    b: Int = 66;
}

contract Defaults {
    d: IntDefaults;

    init() {
        self.d = IntDefaults{};
    }
}