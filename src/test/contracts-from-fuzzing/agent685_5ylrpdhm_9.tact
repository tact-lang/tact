struct WithDefaults {
    foo: Int = 10;
    bar: Bool = true;
}

contract DefaultsInStruct {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{};
    }
}