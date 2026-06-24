struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct MiddleOptional {
    nested: NestedOptional;
    d: Int;
}

contract NestedOptionalTest {
    data: MiddleOptional;

    init() {
        self.data = MiddleOptional{
            nested: NestedOptional{
                a: null,
                b: null,
                c: null
            },
            d: 22
        };
    }
}