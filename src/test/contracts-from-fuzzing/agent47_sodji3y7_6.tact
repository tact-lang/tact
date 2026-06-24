struct WithDefaults {
    foo: Int = 42;
    bar: Bool = false;
    baz: Int?;
}

contract TestContract {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            baz: null
        };
    }
}