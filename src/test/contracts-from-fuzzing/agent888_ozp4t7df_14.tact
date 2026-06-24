struct DeepOptionalInner {
    x: Int?;
    y: String?;
}

struct OptionalOuter {
    field: DeepOptionalInner?;
    note: String;
}

contract NestedOptionalField {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{
            field: null,
            note: "test",
        };
    }
}