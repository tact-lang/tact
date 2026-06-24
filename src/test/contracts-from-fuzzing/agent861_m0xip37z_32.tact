struct WithDefaults {
    foo: Int = 3;
    bar: Bool = true;
}

contract StructDefaultsAssign {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}
