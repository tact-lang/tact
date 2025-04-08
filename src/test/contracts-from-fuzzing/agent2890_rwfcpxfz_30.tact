struct IntDefaults {
    x: Int = 1;
    y: Int = 2;
}

contract ConstDefaults {
    s: IntDefaults;

    init() {
        self.s = IntDefaults{};
    }
}