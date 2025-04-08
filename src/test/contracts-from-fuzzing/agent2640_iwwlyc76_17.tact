struct IntOptionalDefaults {
    x: Int = 42;
    y: Int? = null;
    z: Int? = 99;
}

contract TestContract {
    foo: IntOptionalDefaults;

    init() {
        self.foo = IntOptionalDefaults{};
    }
}
