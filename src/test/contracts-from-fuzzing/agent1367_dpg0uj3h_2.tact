struct InnerParam {
    foo: Int;
    bar: Bool?;
    baz: Address?;
    nested: NestedParam;
}

struct NestedParam {
    x: Int;
    y: Int?;
}

contract NestedOptionals {
    param: InnerParam;

    init() {
        self.param = InnerParam{
            foo: 1,
            bar: null,
            baz: null,
            nested: NestedParam{
                x: 2,
                y: null,
            },
        };
    }
}