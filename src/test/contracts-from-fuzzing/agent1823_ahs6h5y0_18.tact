struct OptionalStruct {
    nested: Nested?;
}

struct Nested {
    foo: Int;
}

contract OptionalWholeStruct {
    s: OptionalStruct?;

    init() {
        self.s = OptionalStruct{
            nested: Nested{foo:123}
        };
    }
}