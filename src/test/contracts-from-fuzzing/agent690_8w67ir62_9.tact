struct NestedOptional {
    nested: InnerOptional?;
}

struct InnerOptional {
    v: Int?;
}

contract NestedOptTest {
    s: NestedOptional;

    init() {
        self.s = NestedOptional{
            nested: InnerOptional{
                v: null,
            },
        };
    }
}