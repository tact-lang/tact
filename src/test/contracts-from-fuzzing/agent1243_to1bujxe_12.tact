struct WithDefaults {
    foo: Int = 42;
    bar: Bool = true;
    baz: String = "hello";
}

contract Test {
    s: WithDefaults;
    init() {
        self.s = WithDefaults{};
    }
}