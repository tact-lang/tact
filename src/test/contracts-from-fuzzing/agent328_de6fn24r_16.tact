struct HasDefaults {
    a: Int = 42;
    b: Bool = false;
    c: String = "hi";
}

contract Test {
    foo: HasDefaults;
    init() {
        self.foo = HasDefaults{};
    }
}