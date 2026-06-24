struct OptionalNested {
    nested: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalNestedContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            nested: null,
        };
    }
}
