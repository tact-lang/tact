struct ComplexOptional {
    foo: Int?;
    bar: Bool?;
    nested: NestedOpt?;
}

struct NestedOpt {
    baz: String?;
}

contract OptContract {
    data: ComplexOptional;
    init() {
        self.data = ComplexOptional{
            foo: null,
            bar: true,
            nested: NestedOpt{
                baz: "hi"
            }
        };
    }
}