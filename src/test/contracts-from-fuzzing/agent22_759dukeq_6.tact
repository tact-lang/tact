struct OptionalNested {
    nestedOpt: Nested?
}

struct Nested {
    optInt: Int?;
    flag: Bool;
}

contract OptNestedTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            nestedOpt: Nested{
                optInt: null,
                flag: false,
            },
        };
    }
}
