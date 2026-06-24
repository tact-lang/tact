struct NestedOptional {
    nested: InnerOpt?;
}

struct InnerOpt {
    a: Int;
    b: String?;
}

contract NestedOptTest {
    data: NestedOptional;
    init() {
        self.data = NestedOptional{
            nested: InnerOpt{ a: 5, b: null }
        };
    }
}
