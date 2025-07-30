struct NestedOptional {
    foo: Int?;
    bar: Bool?;
    nested: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: String?;
}

contract Test {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            foo: null,
            bar: true,
            nested: InnerOpt{ x:1, y:"yo" }
        };
    }
}