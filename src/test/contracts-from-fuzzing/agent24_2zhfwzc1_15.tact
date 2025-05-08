struct WithOptionalOverrides {
    a: Int?;
    b: Bool?;
}

contract OptionalFieldOverrideTest {
    someVal: Int = 42;
    optionals: WithOptionalOverrides;

    init() {
        self.someVal = 100;
        self.optionals = WithOptionalOverrides{
            a: null,
            b: true,
        };
    }
}