struct SZeroDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract DefaultsContract {
    foo: SZeroDefaults;

    init() {
        self.foo = SZeroDefaults{};
    }
}