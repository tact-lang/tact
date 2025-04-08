struct WithDefaults {
    foo: Int = 42;
    bar: Bool = false;
}

contract DefaultStruct {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}