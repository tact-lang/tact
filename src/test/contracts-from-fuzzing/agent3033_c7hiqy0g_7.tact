struct WithDefaults {
    foo: Int = 42;
    bar: Bool = true;
    baz: Address;
}

contract TestContract {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            baz: myAddress()
        };
    }
}
