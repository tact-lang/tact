struct OptionalNest {
    hello: String?;
    foo: Int?;
    yes: Bool?;
}

contract WithNestedOptionals {
    field: OptionalNest;

    init() {
        self.field = OptionalNest{
            hello: null,
            foo: 42,
            yes: null,
        };
    }
}
