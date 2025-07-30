struct HasDefaults {
    foo: Int = 5;
    bar: Bool = true;
    baz: String = "hello";
}

contract TestDefaults {
    state: HasDefaults;
    init() {
        self.state = HasDefaults{};
    }
}