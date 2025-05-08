struct DeepOptionalNested {
    foo: Int;
    bar: Bool?;
    nested: NestedOptional?;
}

struct NestedOptional {
    baz: String;
    qux: Int?;
}

contract DeepOptionals {
    optDeep: DeepOptionalNested;

    init() {
        self.optDeep = DeepOptionalNested{
            foo: 7,
            bar: false,
            nested: NestedOptional{
                baz: "hello",
                qux: null,
            },
        };
    }
}
