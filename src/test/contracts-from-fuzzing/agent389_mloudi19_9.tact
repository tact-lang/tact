struct OptionalDeep {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

struct NestedOpt {
    deeper: OptionalDeep;
    num: Int;
}

contract NestedOptional {
    inner: NestedOpt;

    init() {
        self.inner = NestedOpt{
            deeper: OptionalDeep{
                foo: null,
                bar: true,
                baz: null
            },
            num: 42
        };
    }
}
