struct OptionalDeep {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct WithNestedOptional {
    nested: OptionalDeep?;
    intVal: Int;
}

contract TestContract {
    example: WithNestedOptional;

    init() {
        self.example = WithNestedOptional{
            nested: OptionalDeep{
                a: null,
                b: "hello",
                c: true,
            },
            intVal: 123,
        };
    }
}
