struct WithDefaults {
    foo: Int = 7;
    bar: Bool = false;
    baz: String = "default";
}

contract TestDefaults {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}
