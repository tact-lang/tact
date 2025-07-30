struct IntDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract DefaultsContract {
    s: IntDefaults;

    init() {
        self.s = IntDefaults{};
    }
}