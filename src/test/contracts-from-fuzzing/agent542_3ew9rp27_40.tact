struct IntDefaults {
    a: Int = 7;
    b: Int = 8;
}

contract TestContract {
    d: IntDefaults;

    init() {
        self.d = IntDefaults{};
    }
}