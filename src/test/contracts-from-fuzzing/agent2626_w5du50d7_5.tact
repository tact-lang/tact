struct OptionalNested {
    a: Int?;
    b: Bool?;
}

contract NestedOptionalFieldTest {
    nested: OptionalNested;

    init() {
        self.nested = OptionalNested{
            a: null,
            b: true
        };
    }
}