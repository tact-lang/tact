struct OptionalInsideNested {
    innerStr: String?;
    innerInt: Int?;
}

struct WithNestedOptional {
    nested: OptionalInsideNested?;
    flag: Bool;
}

contract OptionalInOptional {
    data: WithNestedOptional;

    init() {
        self.data = WithNestedOptional{
            nested: OptionalInsideNested{
                innerStr: null,
                innerInt: 123,
            },
            flag: true
        };
    }
}
