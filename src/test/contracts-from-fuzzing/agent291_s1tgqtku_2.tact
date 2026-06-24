struct DeeplyNested {
    ns1: NestedOptional;
    ns2: NestedOptional;
}

contract DeepNestedTest {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            ns1: NestedOptional{foo: null, bar: null, baz: null},
            ns2: NestedOptional{foo: null, bar: null, baz: null},
        };
    }
}

struct NestedOptional {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}
