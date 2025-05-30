struct OptionalNest {
    a: Int?;
    b: Nested?;
}

struct Nested {
    x: Int;
    y: Bool?;
}

contract NestedOptionalTest {
    data: OptionalNest;
    init() {
        self.data = OptionalNest{
            a: null,
            b: Nested{
                x: 7,
                y: null,
            },
        };
    }
}
