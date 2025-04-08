struct HasDefaults {
    foo: Int = 10;
    bar: Bool = true;
    baz: String = "hello";
}

contract DefaultsStruct {
    s: HasDefaults;

    init() {
        self.s = HasDefaults{};
    }
}