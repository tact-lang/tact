struct DeepOptionalDefaults {
    foo: Int? = null;
    bar: Int? = 0;
    baz: Int? = 123;
}

contract DeepOptionalDefaultsContract {
    data: DeepOptionalDefaults;

    init() {
        self.data = DeepOptionalDefaults{};
    }

    receive() {}
}