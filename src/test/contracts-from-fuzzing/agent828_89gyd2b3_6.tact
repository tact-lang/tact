struct OptionalNested {
    innerOpt: Int?;
    innerBool: Bool?;
}

struct WithNestedOptional {
    outerVal: Int;
    nested: OptionalNested?;
}

contract OptNestedTest {
    field: WithNestedOptional;

    init() {
        self.field = WithNestedOptional{
            outerVal: 11,
            nested: OptionalNested{
                innerOpt: null,
                innerBool: false,
            },
        };
    }
}