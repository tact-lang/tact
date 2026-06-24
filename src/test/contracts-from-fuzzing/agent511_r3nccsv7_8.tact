struct OptionalNested {
    foo: Int?;
    nested: Nested?;
}

struct Nested {
    x: Int;
    y: String;
}

contract OptionalNestedContract {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{
            foo: null,
            nested: Nested{ x: 1, y: "yo" }
        };
    }
}