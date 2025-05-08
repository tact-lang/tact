struct WithDefaults {
    foo: Int = 1;
    bar: Bool = false;
    baz: String = "x";
}

contract DefaultStruct {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{};
    }
}