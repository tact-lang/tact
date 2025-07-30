struct OptionalNested {
    inner: Nested?;
}

struct Nested {
    value: Int;
}

contract OptionalNestContract {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{
            inner: null
        };
    }
}