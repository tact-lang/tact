struct Nested {
    foo: Int;
    bar: Int?;
    baz: String?;
}

contract OptionalNestedFields {
    val: Nested;
    
    init() {
        self.val = Nested{
            foo: 10,
            bar: null,
            baz: "hello"
        };
    }
}
