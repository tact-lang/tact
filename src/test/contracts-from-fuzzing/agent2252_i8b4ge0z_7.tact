struct NestedOptional {
    a: Int?;
    b: Bool?;
}

contract OptionalStructField {
    foo: NestedOptional;
    init() {
        self.foo = NestedOptional{ a: null, b: true };
    }
}