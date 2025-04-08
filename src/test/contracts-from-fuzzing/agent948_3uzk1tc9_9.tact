struct NestedOptional {
    foo: Int?;
    bar: String?;
}

struct NestedOptionalOuter {
    nested: NestedOptional?;
    label: String;
}

contract OptionalNestedStructTest {
    rec: NestedOptionalOuter;

    init() {
        self.rec = NestedOptionalOuter{
            nested: NestedOptional{
                foo: 33,
                bar: "zzz"
            },
            label: "outer"
        };
    }
}