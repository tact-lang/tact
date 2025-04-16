struct WithDefaults {
    foo: Int? = 1;
    bar: Bool? = true;
    baz: String? = "hello";
}

contract OptionalDefaulted {
    val: WithDefaults?;

    init() {
        self.val = WithDefaults{};
    }
}