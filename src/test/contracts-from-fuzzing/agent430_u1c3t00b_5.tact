struct IntDefaults {
    a: Int = 1;
    b: Int = -1;
    c: Int = 0;
}

contract Test {
    data: IntDefaults;

    init() {
        self.data = IntDefaults{};
    }
}