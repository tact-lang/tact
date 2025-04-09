struct OptionalNest {
    foo: Int?;
    nested: Nested?;
}

struct Nested {
    bar: Bool;
    baz: String?;
}

contract OptStructStorage {
    opt: OptionalNest;

    init() {
        self.opt = OptionalNest{
            foo: null,
            nested: null
        };
    }
}