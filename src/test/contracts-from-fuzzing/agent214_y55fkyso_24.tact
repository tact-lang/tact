struct Nested {
    a: Int;
    b: String;
}

contract OptionalNestedStruct {
    foo: Nested?;

    init() {
        self.foo = Nested{
            a: 10,
            b: "hi"
        };
    }
}