struct OptionalNested {
    nested: NestedPoint?;
    number: Int;
}

struct NestedPoint {
    x: Int;
    y: Int;
}

contract OptNestedField {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            nested: null,
            number: 999
        };
    }
}