struct OptionalNested {
    x: Int?;
    y: Bool?;
}

struct NestedWithOptionalNested {
    inner: OptionalNested;
}

contract TestContract {
    field: NestedWithOptionalNested;

    init() {
        self.field = NestedWithOptionalNested{
            inner: OptionalNested{
                x: null,
                y: null,
            }
        };
    }
}