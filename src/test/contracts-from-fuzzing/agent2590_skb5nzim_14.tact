struct IntDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract DefaultsContract {
    foo: IntDefaults;
    init() {
        self.foo = IntDefaults{};
    }
}