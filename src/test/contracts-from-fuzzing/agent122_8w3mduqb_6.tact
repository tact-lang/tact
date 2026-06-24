struct OneNestedOptional {
    foo: Int?;
    bar: Bool?;
}

struct WithDeepOptional {
    nested: OneNestedOptional?;
    val: Int;
}

contract OptionalStructInOptionalField {
    storage: WithDeepOptional = WithDeepOptional{
        nested: null,
        val: 0,
    };
    init() {
        self.storage = WithDeepOptional{
            nested: OneNestedOptional{
                foo: 123,
                bar: true,
            },
            val: 42,
        };
    }
}
