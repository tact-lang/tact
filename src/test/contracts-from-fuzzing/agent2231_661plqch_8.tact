struct OptionInNestedStruct {
    value: Int?;
}

struct OuterWithOptionalNested {
    nested: OptionInNestedStruct?;
    val: Int;
}

contract OptionalNestedStructContract {
    foo: OuterWithOptionalNested;

    init() {
        self.foo = OuterWithOptionalNested{
            nested: null,
            val: 42,
        };
    }
}