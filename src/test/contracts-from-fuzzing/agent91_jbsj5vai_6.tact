struct WithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: Int;
    d: Bool;
}

contract DefaultValuesContract {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            c: 42,
            d: false
        };
    }
}
