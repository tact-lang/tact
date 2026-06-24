struct HasDefaults {
    foo: Int = 100;
    bar: Bool = false;
    baz: String = "default";
}

contract DefaultsTest {
    s: HasDefaults;

    init() {
        self.s = HasDefaults{};
    }

    receive() {}
}