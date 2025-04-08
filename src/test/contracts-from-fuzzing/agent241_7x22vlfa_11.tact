struct InlineDefaults {
    foo: Int = 11;
    bar: Bool = false;
    baz: String = "init";
}

contract StructWithDefaults {
    state: InlineDefaults;

    init() {
        self.state = InlineDefaults{};
    }
}