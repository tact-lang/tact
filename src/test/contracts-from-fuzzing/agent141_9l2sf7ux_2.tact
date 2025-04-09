struct OptionalNest {
    maybeNested: Nested?;
}

struct Nested {
    flag: Bool;
    data: String;
}

contract OptNestedTest {
    opt: OptionalNest;

    init() {
        self.opt = OptionalNest{
            maybeNested: Nested{
                flag: true,
                data: "x"
            }
        };
    }
}