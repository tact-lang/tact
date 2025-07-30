struct DoubleDefault {
    a: Int = 1;
    b: Int = 2;
}

contract NestedDefaults {
    s1: DoubleDefault;
    s2: DoubleDefault;

    init() {
        self.s1 = DoubleDefault{};
        self.s2 = DoubleDefault{};
    }
}