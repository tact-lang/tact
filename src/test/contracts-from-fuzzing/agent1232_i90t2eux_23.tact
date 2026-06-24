struct Nested {
    a: Int;
    b: Int?;
}

contract OptionalNested {
    foo: Nested?;

    init() {
        self.foo = Nested{
            a: 77,
            b: null,
        };
    }
}