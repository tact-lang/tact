struct IntDefaults {
    a: Int = 1;
    b: Int = 2;
}

contract StructWithDefaults {
    st: IntDefaults;

    init() {
        self.st = IntDefaults{};
    }
}
