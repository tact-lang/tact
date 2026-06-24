struct WithDefaults {
    foo: Int = 5;
    bar: Bool = true;
}

contract StructWithDefaults {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}
