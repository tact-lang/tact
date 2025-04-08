struct HasDefaults {
    foo: Int = 1;
    bar: String = "abc";
    baz: Bool = false;
}

contract Defaults {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}