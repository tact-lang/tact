struct OptionalCombination {
    first: Int?;
    second: Int;
    third: Int?;
}

contract MixedOptionalFieldTest {
    foo: OptionalCombination;

    init() {
        self.foo = OptionalCombination{
            first: null,
            second: 5,
            third: null,
        };
    }
}